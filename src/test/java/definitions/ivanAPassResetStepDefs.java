package definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import static org.assertj.core.api.Assertions.*;
import java.time.Duration;


import static support.TestContext.getDriver;

public class ivanAPassResetStepDefs {
    @When("I click link or button by text {string}")
    public void iClickForgotPasswordLink(String text) {
//        getDriver().findElement(By.xpath("//a[contains(text(),'"+text+"')]")).click();
        WebElement element = getDriver().findElement(By.xpath("//*[contains(text(),'"+text+"')]"));
        JavascriptExecutor executor = (JavascriptExecutor) getDriver();
        executor.executeScript("arguments[0].click();", element);
    }

    @Given("I got to email inbox")
    public void iGotToEmailInbox() {
        getDriver().get("https://generator.email/ypuf7rgd@dmxs8.com");
    }

    @Then("I switch to first window")
    public void iSwitchToFirstWindow() {
        getDriver().switchTo().window(getDriver().getWindowHandles().iterator().next());
    }
    @Then("I wait for element with text {string} to be present")
    public void iWaitForElementWithXpathToBePresent(String text) {
        new WebDriverWait(getDriver(), Duration.ofSeconds(10)).until(ExpectedConditions.presenceOfElementLocated(By.xpath("//*[contains(text(),'"+text+"')]")));
    }

    @And("I close the current window")
    public void iCloseTheCurrentWindow() {
        getDriver().close();
    }

    @Then("I check the response message to be {string}")
    public void iCheckTheResponseMessage(String msg) {
        String actualText="";
        boolean passChangedMsg = true;
        String errorText = "";
        boolean passErrorMsg = false;
        try {
            actualText = getDriver().findElement(By.xpath("//h4[contains(text(),'Your Password was Changed')]")).getText();
            WebElement messageElement = getDriver().findElement(By.xpath("//h4[contains(text(),'Your Password was Changed')]"));
            passChangedMsg = messageElement.isDisplayed();
        }catch(NoSuchElementException ignored){};
        try {
            errorText = getDriver().findElement(By.xpath("//mat-error[@role='alert']")).getText();
            WebElement errorElement = getDriver().findElement(By.xpath("//mat-error[@role='alert']"));
            passErrorMsg = errorElement.isDisplayed();
        }catch (NoSuchElementException ignored){};


        if(msg.equals("Password mismatch") & passErrorMsg & errorText.equals("Entered passwords should match")){
            System.out.println("Error Message 'Password mismatch' appears correctly, Test has PASSED");
        }
        else if(msg.equals("New Password cannot be old") & passChangedMsg){
            String firstError = getDriver().findElement(By.xpath("(//mat-error[@role='alert'])[1]")).getText();
            String secondError = getDriver().findElement(By.xpath("(//mat-error[@role='alert'])[2]")).getText();
            assertThat(firstError).containsIgnoringCase("New Password cannot be old password");
            assertThat(secondError).containsIgnoringCase("New Password cannot be old password");
            System.out.println("'New Password cannot be old password' Error message is displaying correctly");
        }
        else if (msg.equals("Your Password was Changed") & actualText.equals(msg)){
            System.out.println("Password was changed Successfully");
        }
        else if(msg.equals("Field Required")){
            String firstError = getDriver().findElement(By.xpath("(//mat-error[@role='alert'])[1]")).getText();
            String secondError = getDriver().findElement(By.xpath("(//mat-error[@role='alert'])[2]")).getText();
            assertThat(firstError).containsIgnoringCase("This field is required");
            assertThat(secondError).containsIgnoringCase("This field is required");
            System.out.println("'Field Required' Error message is displaying correctly");
        }
        else if (msg.equals("Password too short")){
            String firstError = getDriver().findElement(By.xpath("(//mat-error[@role='alert'])[1]")).getText();
            String secondError = getDriver().findElement(By.xpath("(//mat-error[@role='alert'])[2]")).getText();
            assertThat(firstError).containsIgnoringCase("Should be at least 5 characters");
            assertThat(secondError).containsIgnoringCase("Should be at least 5 characters");
            System.out.println("'Should be at least 5 characters' Error message is displaying correctly");
        }
        else if(msg.equals("Password is too long")){
            String firstError = getDriver().findElement(By.xpath("(//mat-error[@role='alert'])[1]")).getText();
            String secondError = getDriver().findElement(By.xpath("(//mat-error[@role='alert'])[2]")).getText();
            assertThat(firstError).containsIgnoringCase("New Password should be maximum 32 characters");
            assertThat(secondError).containsIgnoringCase("New Password should be maximum 32 characters");
            System.out.println("'New Password should be maximum 32 characters' Error message is displaying correctly");
        }
        else if(msg.equals("Whitespace Error")){
            String firstError = getDriver().findElement(By.xpath("(//mat-error[@role='alert'])[1]")).getText();
            String secondError = getDriver().findElement(By.xpath("(//mat-error[@role='alert'])[2]")).getText();
            assertThat(firstError).containsIgnoringCase("Whitespaces are not allowed");
            assertThat(secondError).containsIgnoringCase("Whitespaces are not allowed");
            System.out.println("'Whitespaces are not allowed' Error message is displaying correctly");
        }
        else {
            System.out.println("Password was not changed");
        }
    }


    @Then("I check that I am on login page")
    public void iCheckThatIAmOnHomePage() {
        assertThat(getDriver().findElement(By.xpath("//span[contains(text(),'Sign In')]")).isDisplayed()).isTrue();
    }
}
