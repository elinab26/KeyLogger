# Linux Input Event Reader (Educational Project)

## 📖 Introduction  
This project is an **educational tool** to learn how Linux input devices (`/dev/input/eventX`) work.  
It reads raw keyboard events and stores them in a **local file**, `logs.txt`, in order to study the `struct input_event` structure and low-level system calls (`open`, `read`, `write`) in assembly (x86-64, AT&T syntax).  

⚠️ **Disclaimer**  
- This project is provided **for educational and experimental purposes only**.  
- It must be used **only on your own machine or in a virtual machine**.  
- It must **never** be installed or executed on someone else’s computer without their explicit consent (that would be illegal).  
- **I take no responsibility** for the use of this code. Any misuse (espionage, data theft, unauthorized surveillance, etc.) is strictly prohibited and remains entirely the user’s responsibility.  

---

## 🎯 Learning Goals
- Explore how Linux input devices work.  
- Understand the `input_event` structure.  
- Practice low-level system calls (`open`, `read`, `write`).  
- Write assembly in AT&T syntax on x86-64.  
- Map Linux keycodes to ASCII characters.  

---

## ⚙️ How It Works
- The program opens a keyboard event file (`/dev/input/event0`).  
- Each keystroke is captured as a binary structure (`input_event`).  
- Events are **saved locally in a text file** for analysis.  

---

## 🚧 Limitations
- Works only on Linux (requires access to `/dev/input`).  
- Requires root privileges or membership in the `input` group.  
- Does not currently handle:  
  - Uppercase letters  
  - Accented characters  
  - Non-QWERTY keyboard layouts  

---

## 📜 License
This project is released **for educational and experimental purposes only**.  
**Any illegal or unauthorized use is strictly prohibited and under the sole responsibility of the user.**
