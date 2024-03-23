package definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.assertj.core.api.AssertionsForClassTypes;
import org.openqa.selenium.By;

import static support.TestContext.getDriver;

public class SingleChoiceShowstopperKyryloStepdefs {
    @Then("{string} option should be displayed")
    public void optionShouldBeDisplayed(String iconName) {
        AssertionsForClassTypes.assertThat(getDriver().findElement(By.xpath("//span[contains(text(), '" + iconName + "')]")).isDisplayed()).isTrue();
    }

    @And("make Question {int} Showstopper")
    public void makeQuestionShowstopper(int num) {
        if (num == 1) {
            getDriver().findElement(By.xpath("(//*[@class='mat-checkbox-inner-container'])")).click();
        } else {
            getDriver().findElement(By.xpath("(//*[@class='mat-checkbox-inner-container'])[" + num + "]")).click();
        }
    }

    @And("* should be displayed near {string}")
    public void shouldBeDisplayedNear(String qNum) {
        String xpath = "//mat-panel-title[contains(text(),'" + qNum + "*')]";
    }

    @Then("{string} should be displayed")
    public void shouldBeDisplayed(String iconName) {
        AssertionsForClassTypes.assertThat(getDriver().findElement(By.xpath("//span[contains(text(), '"+iconName+"')]")).isDisplayed()).isTrue();
    }
    }









