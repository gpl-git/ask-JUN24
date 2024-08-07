package definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.By;

import static support.TestContext.getDriver;
import static org.assertj.core.api.Assertions.assertThat;

public class ecaterinaWSingleChoiceQOtherStepsDefs {
    @Then("{string} option should be displayed")
    public void optionShouldBeDisplayed(String option) {
        assertThat(getDriver().findElement(By.xpath("//input[@id='mat-checkbox-1-input']")).isDisplayed()).isTrue();
    }

    @When("I mark other text option")
    public void iMarkOtherTextOption() {
        getDriver().findElement(By.xpath("//label[@for='mat-checkbox-1-input'][@class='mat-checkbox-layout']")).click();
    }

    @When("I click on {string} test")
    public void iClickOnTest(String test) {
        getDriver().findElement(By.xpath("//mat-panel-title[contains(text(),'"+test+"')]")).click();
    }

    @And("I click {string} test button")
    public void iClickTestButton(String test) {
        getDriver().findElement(By.xpath("//mat-panel-title[contains(text(),'"+test+"')]/../../../div/div/div/div/a")).click();
    }
}
