package definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.By;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;


import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.By;

import static support.TestContext.getDriver;
import static org.assertj.core.api.Assertions.assertThat;

public class RegQuizTotalQuestionsUlan {
    @Given("I open {string} page of the ASK page US")
    public void iOpenPageOfTheASKPageUS(String url) {
        if (url.contains("registration")) {
            getDriver().get("http://ask-qa.portnov.com/#/registration");
        } else if (url.contains("login")) {
            getDriver().get("http://ask-qa.portnov.com/#/login");
        } else {
            System.out.println("This website is not supported " + url);
        }
    }

    @And("I wait for {int} sec")
    public void iWaitForSec(int sec) throws InterruptedException {
        Thread.sleep(1000 * sec);
    }

    @When("I type {string} into firstname filed of the ASK page")
    public void iTypeIntoFirstnameFiledOfTheASKPage(String firstName) {
        getDriver().findElement(By.xpath("//input[@formcontrolname='firstName']")).sendKeys(firstName);
    }

    @And("I type {string} into lastname field of the ASK page")
    public void iTypeIntoLastnameFieldOfTheASKPage(String lastName) {
        getDriver().findElement(By.xpath("//input[@formcontrolname='lastName']")).sendKeys(lastName);

    }

    @When("I type {string} into email field of the ASK page")
    public void iTypeIntoEmailFieldOfTheASKPage(String email) {
        getDriver().findElement(By.xpath("//input[@formcontrolname='email']")).sendKeys(email);
    }

    @And("I type {string} into group field of the ASK page")
    public void iTypeIntoGroupFieldOfTheASKPage(String group) {
        getDriver().findElement(By.xpath("//input[@formcontrolname='group']")).sendKeys(group);
    }

    @When("I type {string} into password field of the ASK page")
    public void iTypeIntoPasswordFieldOfTheASKPage(String password) {
        getDriver().findElement(By.xpath("//input[@formcontrolname='password']")).sendKeys(password);

    }

    @And("I type {string} into confirmPassword field of the ASK page")
    public void iTypeIntoConfirmPasswordFildOfTheASKPage(String password) {
        getDriver().findElement(By.xpath("//input[@formcontrolname='confirmPassword']")).sendKeys(password);

    }

    @When("I submit the form of the ASK page")
    public void iSubmitTheFormOfTheASKPage() {
        getDriver().findElement(By.xpath("//button[@type='submit']")).click();
    }

    @Then("confirmation message should be displayed of the ASK page")
    public void confirmationMessageShouldBeDisplayedOfTheASKPage() {
        assertThat(getDriver().findElement(By.xpath("//mat-card")).isDisplayed()).isTrue();
    }

    @Then("message {string} should be displayed of the ASK page")
    public void messageShouldBeDisplayedOfTheASKPage(String expMessage) {
        String actMessage = getDriver().findElement(By.xpath("//h4")).getText();
        System.out.println(actMessage);
        assertThat(actMessage.contains(expMessage)).isTrue();

    }

    @Then("error message {string} should be displayed of the ASK page")
    public void errorMessageShouldBeDisplayedOfTheASKPage(String expError) {
        String actError = getDriver().findElement(By.xpath("(//mat-error)[1]")).getText();
        assertThat(actError.equals(expError)).isTrue();
    }


}

