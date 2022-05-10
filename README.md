# Plymouth Installer
Plymouth Installer is a script that will install and configure Plymouth even adding the included boot screen 

# How to use
Step 1: Download the script,  
Step 2: Run the script,  
Done 

# Install:

    git clone https://github.com/frazzlesgrant1994/plymouth-installer.git
    cd plymouth-installer
    bash plymouthsetup.sh

# Change boot Screen from installed themes
list installed themes: 
  
    plymouth-set-default-theme -l
    
Set new theme

    sudo plymouth-set-default-theme -R themename
    
Replace "themename" with your chosen theme, e.g.
    
    sudo plymouth-set-default-theme -R spinner
  
 # Change boot Screen from downloaded theme
 
 Copy or move your theme folder to plymouth themes
 
    sudo cp path/to/downloaded/theme /usr/share/plymouth/themes/
    or 
    sudo mv path/to/downloaded/theme /usr/share/plymouth/themes/
    
 Set new theme

    sudo plymouth-set-default-theme -R themename   
