package definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.By;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;

public class OlgaStepdefs {
    @Given("I open {string}")
    public void iOpen(String url) {
        if (url.equalsIgnoreCase("sample")) {
            getDriver().get("https://skryabin.com/webdriver/html/sample.html");
        }
    }

    @When("I type {string} into username field")
    public void iTypeIntoUsernameField(String letter) {
        getDriver().findElement(By.xpath("//input[@name='username']")).sendKeys(letter);
    }

    @And("I submit the form")
    public void iSubmitTheForm() {
        getDriver().findElement(By.xpath("//button[@id='formSubmit']")).click();
    }

    @Then("username error message {string} should be displayed")
    public void usernameErrorMessageShouldBeDisplayed(String errorMessage) {
        assertThat(getDriver().findElement(By.xpath("//*[@id='username-error']")).getText().equalsIgnoreCase(errorMessage)).isTrue();

    }
}
