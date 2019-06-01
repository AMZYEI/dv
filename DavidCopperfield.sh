#!/bin/bash

#     This Script Wrote
#             By
#         Amin Azymi
clear
sudo apt-get install libnotify-bin

deleteCommand(){
echo -e "\n\n"
  read -p "What You Want To Delete ? ( TYPE : file / folder ) : " dlt
    case "$dlt" in
      "file")
        echo -e "\n\n"
          read -p "Please Enter Name Of File You Will Want delete : " name
              notify-send "File $name Has Been Deleted...!"
              rm "$name";;
      "folder")
          echo -e "\n\n"
            read -p "Please Enter Name Of Folder You Will Want delete :" folder
                notify-send  "Folder "$folder" Has Been Deleted ...!"
                  rmdir "$folder";;
      esac
}

help(){
    echo -e "Important Command , You Can Type :

    (Download Mode) ==> TYPE : dl

    (Home Directory) ==> TYPE : home

    (Download Directory) ==> TYPE : downloads

    (Pictures Directory) ==> TYPE : pictures

    (Video Directory)  ==> TYPE : videos

    (Templates Directory) ==> TYPE : Templates

    (Documents Directory) ==> TYPE : documents

    (version) ==> TYPE : version

    (Public Directory) ==> TYPE : public

    (Music Directory) ==> TYPE : music

    (Desktop Directory) ==> TYPE : desktop

    (Show Directory File And Folder) ==> TYPE : show

    (Delete  Directory Or File )  ==> TYPE : delete"

}

directory(){

  read -p "Do You Want Stay ? (y/n) :" yn
    case $yn in
      "n")
        notify-send "You Are Quit !";;
        "y" )
        echo -e "\n\n"
        read -p "Do you Want To Make A Folder Or File (y/n ) :" yesno
          case $yesno in
            "n")
              notify-send "No File Or Folder Exist !";;
            "y" )
            echo -e "\n\n"
              read -p "Folder Or File :" filefolder
                case $filefolder in
                    "file")
                    echo -e "\n\n"
                      read -p "Please Enter A Name For This File (Like This ==> DavidCopperfield.txt):" filename
                        touch $filename
                          if [[ -z "$filename" ]]; then
                            notify-send "Your Command Is Empty , File Not Exist !"
                          else
                            notify-send "File $filename , Is Exist In $cmnd"
                          fi;;
                    "folder")
                    echo -e "\n\n"
                      read -p "Please Enter A Name For New Folder : " foldername
                      if [[ -z "$filename" ]]; then
                        notify-send "Your Command Is Empty , File Not Exist !"
                      else
                        mkdir $foldername
                          notify-send "Folder $foldername , Is Exist In $cmnd"
                      fi;;
                    *)
                      notify-send "Your Command Is Worng !";;
                esac;;
            esac;;
          esac
}


while [[ "1" == "1" ]]; do
  clear
  echo -e "Everything You Want Can Tell To David Copperfield !!!\n"

  echo -e "If You Don't Know A Command , Dont Worry ! Just Type 'help'\n\n"
  read -p "Enter Your Command : " cmnd

  case $cmnd in
    "home" )
      cd
        ls "$HOME"
          directory;;
    "desktop")
      cd
        cd "$HOME/Desktop"
          ls "$HOME/Desktop"
            directory;;
    "public")
      cd
        cd "$HOME/Public"
          ls "$HOME/Public"
            directory;;
    "downloads")
      cd
        cd "$HOME/Downloads"
          ls "$HOME/Downloads"
            directory;;
    "pictures")
      cd
        cd "$HOME/Pictures"
          ls "$HOME/Pictures"
            directory;;
    "videos")
      cd
        cd "$HOME/Videos"
          ls "$HOME/Videos"
            directory;;
    "templates")
      cd
        cd "$HOME/Templates"
          ls "$HOME/Templates"
            directory;;
    "documents")
      cd
        cd "$HOME/Documents"
          ls "$HOME/Documents"
            directory;;
    "version")
        clear
        echo -e "\n\n"
        echo -e "David Copperfield Version 1.0 \nThis Script Wrote By Amin Azymi .\nDavid Copperfield Is A Open Source Project \nJust Enjoy IT !"
        notify-send "       David Copperfield Version 1.0

        This Script Wrote By Amin Azymi .

        David Copperfield Is A Open Source Project

        Just Enjoy IT !"

        sleep 20;;

    "help")
        notify-send "Important Command , You Can Type :

            (Download Mode) ==> TYPE : dl

            (Home Directory) ==> TYPE : home

            (Download Directory) ==> TYPE : downloads

            (Pictures Directory) ==> TYPE : pictures

            (Video Directory)  ==> TYPE : videos

            (Templates Directory) ==> TYPE : Templates

            (Documents Directory) ==> TYPE : documents

            (version) ==> TYPE : version

            (Public Directory) ==> TYPE : public

            (Music Directory) ==> TYPE : music

            (Desktop Directory) ==> TYPE : desktop

            (Show Directory File And Folder) ==> TYPE : show

            (Delete Directory Or File ) ==> TYPE: delete"
        clear
        help
        sleep 30;;

      "dl")
        read -p "Please Enter Your Hour For Download : " hour
        read -p "Please Enter Your Minute For Download : " minute
        echo -e "\n\n"
        echo -e "\n\n"
        read -p "Please Enter Your Feature Link : " link
        system_hour=`date +%H`
        system_minute=`date +%M`
        sigma_date=$((system_hour*60+system_minute))
        sigma_date_input=$((hour*60+minute))
        while [[ $sigma_date != $sigma_date_input ]]; do
          sleep 20
          system_hour=`date +%H`
          system_minute=`date +%M`
          sigma_date=$((system_hour*60+system_minute))
          sigma_date_input=$((hour*60+minute))
        done
        cd
        cd Downloads
        wget $link
        if [[ "$?" == "0" ]]; then
          notify-send "Download Complete !"
        else
          notify-send "Error !"
        fi;;

      "show")
        echo -e "\n\nThis Command Show Directory File And Folder !! \n\n"
        read -p "Please Enter Directory Name : " Directory
        echo -e "\n\n"
        case $Directory in
          "home" )
            cd
              ls  "$HOME"
                sleep 30;;
          "desktop")
            cd
              cd "$HOME/Desktop"
                ls "$HOME/Desktop"
                  sleep 30;;
          "public")
            cd
              cd "$HOME/Public"
                ls "$HOME/Public"
                  sleep 30;;
          "downloads")
            cd
              cd "$HOME/Downloads"
                ls "$HOME/Downloads"
                  sleep 30;;
          "pictures")
            cd
              cd "$HOME/Pictures"
                ls "$HOME/Pictures"
                  sleep 30;;
          "videos")
            cd
              cd "$HOME/Videos"
                ls "$HOME/Videos"
                  sleep 30;;
          "templates")
            cd
              cd "$HOME/Templates"
                ls "$HOME/Templates"
                  sleep 30;;
          "documents")
            cd
              cd "$HOME/Documents"
                ls "$HOME/Documents"
                  sleep 30;;
          *)
          notify-send "This Directory Is Not Exist !"
      esac;;

        "delete")
        echo -e "\n\nThis Command Delete File And Folder !! \n\n"
        read -p "Please Enter Directory Name : " Directory
        echo -e "\n\n"
        case $Directory in
          "home" )
            cd
              ls "$HOME"
                deleteCommand;;
          "desktop")
            cd
              cd "$HOME/Desktop"
                ls "$HOME/Desktop"
                  deleteCommand;;
          "public")
            cd
              cd "$HOME/Public"
                ls "$HOME/Public"
                  deleteCommand;;
          "downloads")
            cd
              cd "$HOME/Downloads"
                ls "$HOME/Downloads"
                  deleteCommand;;
          "pictures")
            cd
              cd "$HOME/Pictures"
                ls "$HOME/Pictures"
                  deleteCommand;;
          "videos")
            cd
              cd "$HOME/Videos"
                ls "$HOME/Videos"
                  deleteCommand;;
          "templates")
            cd
              cd "$HOME/Templates"
                ls "$HOME/Templates"
                  deleteCommand;;
          "documents")
            cd
              cd "$HOME/Documents"
                ls "$HOME/Documents"
                  deleteCommand;;
          *)
            notify-send "This Directory Is Not Exist !";;
          esac;;

    *)
      notify-send "Command Not Found !";;
  esac
done
