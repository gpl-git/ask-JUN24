package definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import java.util.List;
import static support.TestContext.getDriver;
import static org.assertj.core.api.Assertions.assertThat;
import io.cucumber.java.en.Given;

public class TextualQuestShowStopper {
    @Given("I navigate to {string} page")
    public void iNavigateToPage(String todo) {
        if(todo.contains("login")) {
            getDriver().get("http://ask-qa.portnov.com/#/login");
        } else if (todo.contains("registration")) {
            getDriver().get("http://ask-qa.portnov.com/#/registration");
        } else {
            System.out.println("The command is not recognized");
        }
    }

    @When("I type {string} into email input field")
    public void iTypeIntoEmailInputField(String email) {

    }

    @When("I sign in using {string} as a login and {string} as a password")
    public void iSignInUsingAsALoginAndAsAPassword(String email, String password) {
        getDriver().findElement(By.xpath("//input[@formcontrolname='email']")).sendKeys(email);
        getDriver().findElement(By.xpath("//input[@formcontrolname='password']")).sendKeys(password);
        getDriver().findElement(By.xpath("//span[text()='Sign In']/..")).click();

    }

    @When("I click on {string} button")
    public void iClickOnButton(String buttonName) {
        getDriver().findElement(By.xpath("//button//*[text()='" + buttonName + "']")).click();
    }

    @When("I type {string} into quiz title input field")
    public void iTypeStringIntoQuizTitleInputField(String title) {
        getDriver().findElement(By.xpath("//input[@formcontrolname = 'name']")).sendKeys(title);
    }

    @And("I click on Add question button")
    public void iClickOnAddQuestionButton() {
        getDriver().findElement(By.xpath("//*[contains(text(),'add_circle')]")).click();
    }

    @When("I choose type of the question as {string}")
    public void iChooseTypeOfTheQuestionAs(String type) {
        getDriver().findElement(By.xpath("//mat-radio-button//*[contains(text(),'" + type + "')]")).click();
    }
}
