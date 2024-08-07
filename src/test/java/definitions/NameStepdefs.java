package definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;

public class NameStepdefs {
    @Given("I open {string} page")
    public void iOpenPage(String url) {
        if (url.contains("registration")) {
            getDriver().get("http://ask-qa.portnov.com/#/registration");
        } else if (url.contains("login")) {
            getDriver().get("http://ask-qa.portnov.com/#/login");
        }else {
            System.out.println("This website is not supported " + url);
        }
    }

    @When("I type {string} into email field")
    public void iTypeIntoEmailField(String email) {
        getDriver().findElement(By.xpath("//input[@formcontrolname='email']")).sendKeys(email);
    }

    @And("I type {string} into password field")
    public void iTypeIntoPasswordField(String password) {
        getDriver().findElement(By.xpath("//input[@formcontrolname='password']")).sendKeys(password);
    }
    @Then("I click {string} button")
    public void iClickButton(String btnName) {
        getDriver().findElement(By.xpath("//span[contains(text(),'"+btnName+"')]")).click();
    }

    @And("I wait for {int} sec")
    public void iWaitForSec(int sec) throws InterruptedException {
        Thread.sleep(1000*sec);
    }

    @Then("user role should be {string}")
    public void userRoleShouldBe(String role) {
        String actRole = getDriver().findElement(By.xpath("//div[@class='info']")).getText();
        assertThat(actRole.contains(role)).isTrue();
    }

    @Then("current url should contain {string}")
    public void currentUrlShouldContain(String expUrl) {
        String curUrl = getDriver().getCurrentUrl();
        assertThat(curUrl.contains(expUrl)).isTrue();
    }

    @When("I click {string} menu item")
    public void iClickMenuItem(String menuItem) {
        getDriver().findElement(By.xpath("//h5[contains(text(), '"+menuItem+"')]")).click();

    }
    
    @Then("element with title {string} should be displayed")
    public void elementWithTitleShouldBeDisplayed(String arg0) {
        List<WebElement> titles = getDriver().findElements(By.xpath("//*[@id='mat-dialog-0']"));
        for (WebElement title:titles  ) {
            if (title.getText().contains(arg0)) {
                assertThat(title.isDisplayed()).isTrue();
            }
        }

    }

    @Then("I clear the input {string}")
    public void iClearTheInput(String arg0) {
        getDriver().findElement(By.xpath("//*[@placeholder='Full Name']")).clear();
    }

    @When("I type {string} into Full Name filed")
    public void iTypeStringIntoFullNameFiled(String Name) {
        getDriver().findElement(By.xpath("//*[@placeholder='Full Name']")).sendKeys(Name);
    }

    @Then("error message {string} should be displayed")
    public void errorMessageShouldBeDisplayed(String expError) {
        String actError = getDriver().findElement(By.xpath("(//mat-error)[1]")).getText();
        assertThat(actError.equals(expError)).isTrue();
    }

}
