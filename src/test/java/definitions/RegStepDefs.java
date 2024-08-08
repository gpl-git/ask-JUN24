package definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.By;

import static support.TestContext.getDriver;
import static org.assertj.core.api.Assertions.assertThat;

public class RegStepDefs {
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

    @And("I wait for {int} sec")
    public void iWaitForSec(int sec) throws InterruptedException {
        Thread.sleep(1000*sec);
    }

    @When("I type {string} into firstname filed")
    public void iTypeIntoFirstnameFiled(String firstName) {
        getDriver().findElement(By.xpath("//input[@formcontrolname='firstName']")).sendKeys(firstName);
    }

    @And("I type {string} into lastname field")
    public void iTypeIntoLastnameField(String lastName) {
        getDriver().findElement(By.xpath("//input[@formcontrolname='lastName']")).sendKeys(lastName);

    }

    @When("I type {string} into email field")
    public void iTypeIntoEmailField(String email) {
        getDriver().findElement(By.xpath("//input[@formcontrolname='email']")).sendKeys(email);
    }

    @And("I type {string} into group field")
    public void iTypeIntoGroupField(String group) {
        getDriver().findElement(By.xpath("//input[@formcontrolname='group']")).sendKeys(group);
    }

    @When("I type {string} into password field")
    public void iTypeIntoPasswordField(String password) {
        getDriver().findElement(By.xpath("//input[@formcontrolname='password']")).sendKeys(password);

    }

    @And("I type {string} into confirmPassword field")
    public void iTypeIntoConfirmPasswordFild(String password) {
        getDriver().findElement(By.xpath("//input[@formcontrolname='confirmPassword']")).sendKeys(password);

    }

    @When("I submit the form")
    public void iSubmitTheForm() {
        getDriver().findElement(By.xpath("//button[@type='submit']")).click();
    }

    @Then("confirmation message should be displayed")
    public void confirmationMessageShouldBeDisplayed() {
        assertThat(getDriver().findElement(By.xpath("//mat-card")).isDisplayed()).isTrue();
    }

    @Then("message {string} should be displayed")
    public void messageShouldBeDisplayed(String expMessage) {
        String actMessage = getDriver().findElement(By.xpath("//h4")).getText();
        System.out.println(actMessage);
        assertThat(actMessage.contains(expMessage)).isTrue();

    }

    @Then("error message {string} should be displayed")
    public void errorMessageShouldBeDisplayed(String expError) {
        String actError = getDriver().findElement(By.xpath("(//mat-error)[1]")).getText();
        assertThat(actError.equals(expError)).isTrue();
    }
}