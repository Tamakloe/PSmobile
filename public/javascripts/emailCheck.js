<script>
/*email check alert*/

function alertemail(which)
{
	if (confirm("You entered \""+which.value+"\" as your email address. Is that correct?"))
		return true
	else
	{
		which.focus()
		return false
	}
}
</script>