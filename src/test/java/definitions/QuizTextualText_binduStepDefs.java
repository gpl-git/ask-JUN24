package definitions;

import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.apache.commons.lang3.RandomStringUtils;
import org.openqa.selenium.By;

import static support.TestContext.getDriver;
import static org.assertj.core.api.Assertions.assertThat;

public class QuizTextualText_binduStepDefs {
    @When("I type {string} into Question")
    public void iTypeIntoQuestion(String textualTitle) {
        getDriver().findElement(By.xpath("//textarea[@formcontrolname='question']")).sendKeys(textualTitle);
    }


    @Then("error message should be displayed")
    public void errorMessageShouldBeDisplayed() {
        assertThat(getDriver().findElement(By.xpath("//mat-error[@role='alert']")).isDisplayed()).isTrue();
    }

    @When("I enter {int} alphanumeric characters")
    public void iEnterAlphanumericCharacters(int number) {
        boolean useLetters = true;
        boolean useNumbers = true;
        String generatedString = RandomStringUtils.random(number, useLetters, useNumbers);
        getDriver().findElement(By.xpath("//*[@formcontrolname='question']")).sendKeys(generatedString);
    }
}

