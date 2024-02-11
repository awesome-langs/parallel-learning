function hello()
  print("Hello World!")
end

function MyFunction(myList)
  local result = ""
  for _, x in ipairs(myList) do
      if x % 2 == 0 then
          local str = tostring(x * 3)
          result = str .. result .. str
      end
  end
  return result
end

hello()
print(MyFunction({1, 2, 3, 4, 5}))