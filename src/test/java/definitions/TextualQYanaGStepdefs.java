package definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import org.assertj.core.api.AssertionsForClassTypes;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;

public class TextualQYanaGStepdefs {
    @And("I make {string} Show-Stopper")
    public void iMakeTheQuestionShowStopper(String qNum) {
        if (qNum.equals("Q1")) {
            getDriver().findElement(By.xpath("(//*[@class='mat-checkbox-inner-container'])")).click();
        } else {
            getDriver().findElement(By.xpath("(//*[@class='mat-checkbox-inner-container'])[2]")).click();
        }
    }

    @Then("Show-Stopper checkbox should be displayed")
    public void showStopperCheckboxShouldBeDisplayed() {
        AssertionsForClassTypes.assertThat(getDriver().findElement(By.xpath("//*[@id='mat-checkbox-1']")).isDisplayed()).isTrue();
    }

    @And("* should be displayed near {string}")
    public void shouldBeDisplayedNear(String qNum) {
        AssertionsForClassTypes.assertThat(getDriver().findElement(By.xpath("//mat-panel-title[contains(text(),'"+qNum+"*')]")).isDisplayed()).isTrue();
    }

    @Then("{string} checkbox should be displayed")
    public void shouldBeDisplayed(String iconName) {
        AssertionsForClassTypes.assertThat(getDriver().findElement(By.xpath("//span[contains(text(), '"+iconName+"')]")).isDisplayed()).isTrue();
    }

    @And("* should not be displayed near {string}")
    public void shouldNotBeDisplayedNear(String qNum) {
        AssertionsForClassTypes.assertThat(getDriver().findElement(By.xpath("//mat-panel-title[contains(text(),'"+qNum+":')]")).isDisplayed()).isTrue();
    }
}
