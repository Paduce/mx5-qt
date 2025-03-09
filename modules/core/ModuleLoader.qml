import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    id: root
    
    // Properties
    property var modules: [] // List of available modules
    property string activeModule: "" // Currently active module
    
    // Methods
    
    // Add a module to the list
    function registerModule(moduleId, moduleComponent, moduleIcon, moduleLabel) {
        modules.push({
            id: moduleId,
            component: moduleComponent,
            icon: moduleIcon,
            label: moduleLabel
        });
    }
    
    // Activate a module
    function activateModule(moduleId) {
        if (modules.some(module => module.id === moduleId)) {
            activeModule = moduleId;
            return true;
        }
        return false;
    }
    
    // Deactivate the current module
    function deactivateModule() {
        activeModule = "";
    }
    
    // Check if a module is active
    function isModuleActive(moduleId) {
        return activeModule === moduleId;
    }
    
    // Get module by ID
    function getModule(moduleId) {
        return modules.find(module => module.id === moduleId);
    }
}