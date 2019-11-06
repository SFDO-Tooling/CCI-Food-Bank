from cumulusci.robotframework.pageobjects import NewModal
from cumulusci.robotframework.pageobjects import pageobject


@pageobject("New", "Delivery")
class DeliveryNewModal(NewModal):
    def open_date_picker(self, title):
        locator = (
            "//div[contains(@class,'forcePageBlockSectionRow')]/"
            "div[contains(@class,'forcePageBlockItem')]/"
            "div[contains(@class,'slds-hint-parent')]/"
            "div[@class='slds-form-element__control']/"
            "div[.//span[text()='{}']]"
            "[//div[contains(@class,'uiMenu')]//"
            "a[@class='select']]"
        ).format(title)
        self.selenium.set_focus_to_element(locator)
        self.selenium.get_webelement(locator).click()

    def pick_date(self, value):
        """To pick a date from the date picker"""
        locator = (
            "//div[contains(@class,'uiDatePickerGrid')]/"
            "table[@class='calGrid']//"
            "span[text()='{}']"
        ).format(value)
        self.selenium.set_focus_to_element(locator)
        self.selenium.get_webelement(locator).click()

    def populate_picklist(self, name, value):
        locator_picklist = (
            "//div[contains(@class, 'uiInput')]"
            "[.//span[contains(@class, 'uiPicklistLabel')]"
            "[.//span[text()='{}']]]//div"
        ).format(name)
        locator_value = (
            "//div[contains(@class, 'uiMenuList') and contains(@class, 'visible')]"
            "//div//ul//li//a[text()='{}']"
        ).format(value)
        self.selenium.set_focus_to_element(locator_picklist)
        picklist = self.selenium.get_webelement(locator_picklist)
        picklist.click()

        self.selenium.set_focus_to_element(locator_value)
        picklist_value = self.selenium.get_webelement(locator_value)
        picklist_value.click()
