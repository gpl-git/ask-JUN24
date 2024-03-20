package definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.apache.maven.surefire.shared.lang3.RandomStringUtils;
import org.openqa.selenium.By;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;

public class RegStepDefs {
    @When("I type {string} into the first name field")
    public void iTypeIntoTheFirastNameField(String fName) {
        getDriver().findElement(By.xpath("//*[@formcontrolname='firstName']")).sendKeys(fName);
    }

    @And("I type {string} into the last name field")
    public void iTypeIntoTheLastNameField(String lName) {
        getDriver().findElement(By.xpath("//*[@formcontrolname='lastName']")).sendKeys(lName);
    }

    @When("I type {string} into group code field")
    public void iTypeIntoGroupCodeField(String group) {
        getDriver().findElement(By.xpath("//*[@formcontrolname='group']")).sendKeys(group);

    }

    @And("I type {string} as confirm password")
    public void iTypeAsConfirmPassword(String confirmPassword) {
        getDriver().findElement(By.xpath("//*[@formcontrolname='confirmPassword']")).sendKeys(confirmPassword);

    }

    @Then("confirmation message {string} should be displayed")
    public void confirmationMessageShouldBeDisplayed(String expMessage) {
        String actMessage = getDriver().findElement(By.xpath("//mat-card")).getText();
        System.out.println(actMessage);
        assertThat(getDriver().findElement(By.xpath("//mat-card")).isDisplayed()).isTrue();
        assertThat(actMessage.contains(expMessage)).isTrue();
    }

    @When("I type {int} characters into password and confirm password field")
    public void iTypeCharactersIntoPasswordAndConfirmPasswordField(int num) {
        boolean useLetters =true;
        boolean useNumbers = true;
        String genString= RandomStringUtils.random(num,useLetters, useNumbers);
        System.out.println(genString);
        System.out.println(genString);
        getDriver().findElement(By.xpath("//*[@formcontrolname ='password']")).sendKeys(genString);
        getDriver().findElement(By.xpath("//*[@formcontrolname ='confirmPassword']")).sendKeys(genString);

    }
}
