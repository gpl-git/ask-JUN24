package definitions;

import io.cucumber.java.en.Then;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;

public class SingleChoiceQuestionTextEkaterinaStepDefs {
    @Then("element with {string} should be displayed")
    public void elementWithXpathShouldBeDisplayed(String xpath) {
        assertThat(getDriver().findElement(By.xpath(xpath)).isDisplayed()).isTrue();
    }

    @Then("{string} should not be displayed on the list of quizzes")
    public void shouldNotBeDisplayedOnTheListOfQuizzes(String quizTitle) {
        List<WebElement> titles = getDriver().findElements(By.xpath("//mat-panel-title"));
        for (WebElement title :titles){
            if (title.getText().contains(quizTitle)){
                assertThat(title.isDisplayed()).isFalse();
            }
        }
    }

    @Then("error message {string} should be displayed")
    public void errorMessageShouldBeDisplayed(String expError) {
        String actError = getDriver().findElement(By.xpath("//mat-error")).getText();
        assertThat(actError.contains(expError)).isTrue();
    }

    @Then("error message should be displayed")
    public void errorMessageShouldBeDisplayed() {
        assertThat(getDriver().findElement(By.xpath("//mat-error")).isDisplayed()).isTrue();
    }
}

