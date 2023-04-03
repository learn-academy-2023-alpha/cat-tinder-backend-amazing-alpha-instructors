cats = [
  {
    name: 'Tobey',
    age: 6,
    enjoys: 'cuddling',
    image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=715&q=80'
  },
  {
    name: 'Garfield',
    age: 45,
    enjoys: 'lasagne',
    image: 'https://live.staticflickr.com/7374/27659345390_feda639960_b.jpg'
  },
  {
    name: 'Heathcliff',
    age: 20,
    enjoys: 'fish',
    image: 'https://static.wikia.nocookie.net/heathcliff/images/b/b8/Heathcliff_promotional.png/revision/latest?cb=20210522181311g'
  },
  {
    name: 'Sox',
    age: 2,
    enjoys: 'Spinning his head',
    image: 'https://images.unsplash.com/photo-1596854407944-bf87f6fdd49e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80'
  },
]

cats.each do |cat|
  Cat.create cat
  puts "creating cat #{cat}"
end