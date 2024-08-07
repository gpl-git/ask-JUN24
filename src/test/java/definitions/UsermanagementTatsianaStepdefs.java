package definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;

public class UsermanagementTatsianaStepdefs {


    @And("I click {string} option")
    public void iClickOption(String opt) {
        getDriver().findElement(By.xpath("//*[contains(text(),'Teachers')]")).click();
    }


    @Then("{string} should be displayed on list of names")
    public void shouldBeDisplayedOnListOfNames(String name) {
        List<WebElement> titles = getDriver().findElements(By.xpath("//mat-tab-body"));
        for (WebElement title:titles  ) {
            if (title.getText().contains(name)) {
                assertThat(title.isDisplayed()).isTrue();
            }

        }
    }


    @When("I click on {string}")
    public void iClickOn(String name) {
        getDriver().findElement(By.xpath("//h4[contains(text(),'"+name+"')]")).click();
    }

    @When("I click on {string} button")
    public void iClickOnButton(String buttonName) {
        getDriver().findElement(By.xpath("//span[contains(.,'"+buttonName+"')]/parent::button")).click();
    }

    @When("I select {string}")
    public void iSelect(String buttonName) {
        getDriver().findElement(By.xpath("//button[contains(.,\""+buttonName+"\")] ")).click();
    }

    @And("I click {string}")
    public void iClick(String role) {
        getDriver().findElement(By.xpath("//span[contains(text(),'"+role+"')]")).click();
    }

    @Then("user role should be displayed {string}")
    public void userRoleShouldBeDisplayed(String role) {
        String actRole = getDriver().findElement(By.xpath("//div[@class='horizontal-group user-meta']//td[text()='"+role+"']")).getText();
        assertThat(actRole.contains(role)).isTrue();

    }

    @When("I click on the {string}")
    public void iClickOnThe(String role) {
        getDriver().findElement(By.xpath("//span[contains(text(),'No, Thanks')]/parent::button")).click();
    }
}
