<h1>Lab 7 How To Run</h1>
<p>This Readme is to demonstrate how to run my Lab 7 Powershell Script<br> 
The module that will be used is the ImportExcel PowerShell Module that allows you to more readily edit Excel sheets and workbooks.
</p>
<h2>Install the Module</h2>
<body>
  <ol>
    <li>Run a PowerShell instance as administrator</li>
    <li>Run the following command: <br>
        <pre><code>Install-Module -Name ImportExcel</code></pre> </li>
    <li>Input "a" when prompted then hit "Enter"</li>
  </ol>
  <h2>Script Description</h2>
  <p>The script itself only requires input at the End.<br>
    Within this script it demonstrates:
    <ul>
      <li>You are able to run PowerShell commands such as <code>Get-Service</code> and export the results to a new Excel Workbook with autosized columns, filtering option arrows already available, and opening upon creation.</li>
      <li>You can create additional sheets as necessary and copy the original sheet that was created.</li>
      <li>Conditional formatting can be added to the sheets from PowerShell</li>
    </ul></p>
    <h2>Running the Script</h2>
      <p>Below are the steps on how to run the script:</p>
      <ol>
        <li>Download the Script from GitHub</li>
      </ol>


  <p>If you don't want the module installed on your machine after running my script, then you can uninstall it by opening up a new PowerShell instance as an Admin and running:<br>
  <pre><code>Uninstall-Module -Name ImportExcel</code></pre></p>
</body>
