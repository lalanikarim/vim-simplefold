" function! SetFoldText()
"  let line = getline(v:foldstart)
"  let line2 = trim(getline(v:foldstart + 1))
"  let last = trim(getline(v:foldend))
"  let sub = line 
"  if v:foldend - v:foldstart > 2 
"    let sub = sub . ' ' . line2
"  endif
"  let lines = v:foldend-v:foldstart + 1
"  return sub . ' ---(' . lines . ' lines)--- '.last   
"endfunction

"set foldexpr=SetFoldText()

function! s:isValid(pos,last_pos)
	" echo "Comparing " . a:pos[1] . "," . a:pos[2] . " with " . a:last_pos[1] . "," . a:last_pos[2]
	if a:pos[1] > a:last_pos[1]
		return v:true
	else 
		if a:pos[1] == a:last_pos[1] && a:pos[2] > a:last_pos[2]
			return v:true 
		endif
	endif
	return v:false
endfunction

function! SimpleFold()
  " set foldmethod=expr
	norm G
	let l:count = 0
	let l:iter = 1
	" echo "Last line: " . l:last_line
	/\/\*\|{\|[\|(
	let l:pos = getpos(".")
	let l:last_pos = [-1,-1,-1,-1]
	" echo l:iter . " iterations done"
	while s:isValid(l:pos,l:last_pos)
		" echo "Processing line " . l:pos[1] . "," . l:pos[2]
		norm mm%
		let l:found = getpos(".")
		" echo "Found pair on " . l:found[1] . "," . l:found[2]
		if l:found[1] > l:pos[1]
			norm %v%zfzo
			let l:count = l:count + 1
		endif
		norm `m
		let l:last_pos = l:pos
		norm n
		let l:pos = getpos(".")
		let l:iter = l:iter + 1
		" echo l:iter . " iterations done"
		if l:iter > 5
		"	break
		endif
	endwhile
	echo l:count . " folds applied"
endfunction

" nmap <leader>f	:call SimpleFold()<CR>
