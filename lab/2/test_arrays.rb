# TEST ARRAYS FOR LAB 8
# ---------------------
%w[http://www.google.com apidock.com www.microsoft.com http://www.heimann-family.org http://www.kli.org http://www.acac.net http://www.cmu.edu http://is.hss.cmu.edu www.amazon.co.uk]

%w[1234567890123456 1234-5678-9012-3456 1234\ 5678\ 9012\ 3456 1234567890 #1234567890123456 1234|5678|9012|3456]


# INITIAL REGEX PATTERN FOR LAB 8
# -------------------------------
pattern = /^(http:\/\/)?www\.\w+\.(com|edu|org)$/