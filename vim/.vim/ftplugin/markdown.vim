" Based on nodejs module 'markdown-to-html'.
" Installation (with sudo/root): 'npm install markdown-to-html -g'
let &makeprg='markdown % {$*} > '.$tmp.'/%<.html && '.$tmp.'/%<.html'

