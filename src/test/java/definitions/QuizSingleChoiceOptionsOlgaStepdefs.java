package definitions;

import de.svenjacobs.loremipsum.LoremIpsum;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.apache.commons.lang3.RandomStringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;
import java.util.stream.Collectors;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;

public class QuizSingleChoiceOptionsOlgaStepdefs {
    List<String> optionsBeforeMove;

    @And("I click on settings icon of Option number {int}")
    public void iClickIcon(int optionNum) {
//        getDriver().findElement(By.xpath("//*[contains(@class,'option-row')]/following-sibling::*//button[span[mat-icon]]")).click();
        getDriver().findElement(By.xpath("//*[@placeholder='Option " + optionNum + "*']/ancestor::*[contains(@class,'option-row')]//button[span[mat-icon]]")).click();
    }

    @Then("{string} should be disabled")
    public void shouldBeDisabled(String option) {
        assertThat(getDriver().findElement(By.xpath("//span[contains(text(),'" + option + "')]/parent::button")).isEnabled()).isFalse();
    }

    @And("I select {string}")
    public void iSelect(String arg0) {
        getDriver().findElement(By.xpath("//span[contains(text(),'Include \"Other\"')]/ancestor::div[@class='checkbox']//div[@class='mat-checkbox-inner-container']")).click();
    }

    @Then("Option {int} should be deleted")
    public void shouldBeDeleted(int option) {
        assertThat(getDriver().findElements(By.xpath("//*[@placeholder='Option " + option + "*']")).isEmpty()).isTrue();
    }

    @And("I click on {string}")
    public void iClickOn(String optionItem) {
        optionsBeforeMove = getDriver().findElements(By.xpath("//*[contains(@placeholder,'Option')]"))
                .stream()
                .map(optionName -> optionName.getAttribute("value"))
                .collect(Collectors.toList());
        getDriver().findElement(By.xpath("//span[contains(text(),'" + optionItem + "')]/parent::button")).click();
    }

    @Then("option {int} should be moved")
    public void optionShouldBeMoved(int option) {
        List<String > optionsAfterMove = getDriver().findElements(By.xpath("//*[contains(@placeholder,'Option')]"))
                .stream()
                .map(optionName -> optionName.getAttribute("value"))
                .collect(Collectors.toList());
        System.out.println(optionsBeforeMove);
        System.out.println(optionsAfterMove);
        assertThat(optionsBeforeMove.indexOf("Option " + option) != optionsAfterMove.indexOf("Option " + option)).isTrue();
    }

    @When("I type {int} characters into {string} field of {string}")
    public void iTypeIntoFieldOf(int charactersNum, String oNum, String qNum) {
        String randomString = RandomStringUtils.randomAlphanumeric(charactersNum);
        getDriver().findElement(By.xpath("//mat-panel-title[contains(text(),'"+qNum+"')]/../../..//*[@placeholder = '"+oNum+"']")).sendKeys(randomString);
    }
}
