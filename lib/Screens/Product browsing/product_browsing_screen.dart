import 'package:flutter/material.dart';

class ProductBrowsingScreen extends StatefulWidget {
  @override
  _ProductBrowsingScreenState createState() => _ProductBrowsingScreenState();
}

class _ProductBrowsingScreenState extends State<ProductBrowsingScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';
  List<String> _categories = ['All', 'Traditional Wear', 'Contemporary', 'Fusion', 'Occasion-Based'];
  List<String> _sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL'];
  List<String> _colors = ['Red', 'Blue', 'Green', 'Black'];
  List<String> _styles = ['Casual', 'Formal', 'Sporty'];
  List<String> _brands = ['Brand A', 'Brand B', 'Brand C'];
  List<String> _sortBy = ['Popularity', 'Price: Low to High', 'Price: High to Low', 'Newest Arrivals'];
  String? _selectedSize;
  String? _selectedColor;
  String? _selectedStyle;
  String? _selectedBrand;
  String? _selectedSortBy;
  RangeValues _selectedPriceRange = RangeValues(0, 1000);
  List<Map<String, dynamic>> _products = [
    // Sample product data
    for (var category in ['All','Traditional Wear', 'Contemporary', 'Fusion'])
      for (var i = 1; i <= 7; i++)
        {'name': '$category Product $i', 'size': 'M','color': 'Red', 'style': 'Casual', 'price': 100 + i * 10, 'category': category, 'brand': 'Brand A'},
  ];
  List<Map<String, dynamic>> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredProducts = _products;
  }

  void _applyFilters() {
    setState(() {
      _filteredProducts = _products.where((product) {
        // Filter by category
        if (_selectedCategory != 'All' && product['category'] != _selectedCategory) {
          return false;
        }
        // Filter by size
        if (_selectedSize != null && product['size'] != _selectedSize) {
          return false;
        }
        // Filter by color
        if (_selectedColor != null && product['color'] != _selectedColor) {
          return false;
        }
        // Filter by style
        if (_selectedStyle != null && product['style'] != _selectedStyle) {
          return false;
        }
        // Filter by brand
        if (_selectedBrand != null && product['brand'] != _selectedBrand) {
          return false;
        }
        // Filter by price
        if (product['price'] < _selectedPriceRange.start || product['price'] > _selectedPriceRange.end) {
          return false;
        }
        // Filter by search query
        if (_searchController.text.isNotEmpty && !product['name'].toLowerCase().contains(_searchController.text.toLowerCase())) {
          return false;
        }
        return true;
      }).toList();

      // Sort by selected option
      if (_selectedSortBy == 'Price: Low to High') {
        _filteredProducts.sort((a, b) => a['price'].compareTo(b['price']));
      } else if (_selectedSortBy == 'Price: High to Low') {
        _filteredProducts.sort((a, b) => b['price'].compareTo(a['price']));
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Browsing'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _applyFilters();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _applyFilters();
                  },
                ),
              ),
              onChanged: (value) {
                _applyFilters();
              },
            ),
          ),
          // Dropdowns in a single line
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Category'),
                      DropdownButton<String>(
                        value: _selectedCategory,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedCategory = newValue!;
                            _applyFilters();
                          });
                        },
                        items: _categories.map<DropdownMenuItem<String>>((String category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Size'),
                      DropdownButton<String>(
                        value: _selectedSize,
                        hint: Text('Select Size'),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedSize = newValue;
                            _applyFilters();
                          });
                        },
                        items: _sizes.map<DropdownMenuItem<String>>((String size) {
                          return DropdownMenuItem<String>(
                            value: size,
                            child: Text(size),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Color'),
                      DropdownButton<String>(
                        value: _selectedColor,
                        hint: Text('Select Color'),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedColor = newValue;
                            _applyFilters();
                          });
                        },
                        items: _colors.map<DropdownMenuItem<String>>((String color) {
                          return DropdownMenuItem<String>(
                            value: color,
                            child: Text(color),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Style'),
                      DropdownButton<String>(
                        value: _selectedStyle,
                        hint: Text('Select Style'),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedStyle = newValue;
                            _applyFilters();
                          });
                        },
                        items: _styles.map<DropdownMenuItem<String>>((String style) {
                          return DropdownMenuItem<String>(
                            value: style,
                            child: Text(style),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Additional Filters
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Brand'),
                      DropdownButton<String>(
                        value: _selectedBrand,
                        hint: Text('Select Brand'),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedBrand = newValue;
                            _applyFilters();
                          });
                        },
                        items: _brands.map<DropdownMenuItem<String>>((String brand) {
                          return DropdownMenuItem<String>(
                            value: brand,
                            child: Text(brand),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sort By'),
                      DropdownButton<String>(
                        value: _selectedSortBy,
                        hint: Text('Sort By'),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedSortBy = newValue;
                            _applyFilters();
                          });
                        },
                        items: _sortBy.map<DropdownMenuItem<String>>((String sortBy) {
                          return DropdownMenuItem<String>(
                            value: sortBy,
                            child: Text(sortBy),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Price Range Slider
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Price Range'),
                RangeSlider(
                  values: _selectedPriceRange,
                  min: 0,
                  max: 1000,
                  divisions: 20,
                  labels: RangeLabels(
                    _selectedPriceRange.start.round().toString(),
                    _selectedPriceRange.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _selectedPriceRange = values;
                      _applyFilters();
                    });
                  },
                ),
              ],
            ),
          ),
          // Submit Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _applyFilters,
              child: Text('Apply Filters'),
            ),
          ),
          // Product List
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.75,
              ),
              itemCount: _filteredProducts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(product: _filteredProducts[index]),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // High-Quality Image
                        Expanded(
                          child: Image.asset(
                            'assets/product_image.png', // Ensure the path is correct
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _filteredProducts[index]['name'],
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Size: ${_filteredProducts[index]['size']}',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Color: ${_filteredProducts[index]['color']}',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Style: ${_filteredProducts[index]['style']}',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Price: \$${_filteredProducts[index]['price']}',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // High-Quality Image
            Expanded(
              child: Image.asset(
                'assets/product_image.png', // Ensure the path is correct
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              product['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Size: ${product['size']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            Text(
              'Color: ${product['color']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            Text(
              'Style: ${product['style']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            Text(
              'Price: \$${product['price']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(product: product),
                  ),
                );
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  CartScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product added to cart:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Name: ${product['name']}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Size: ${product['size']}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Color: ${product['color']}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Style: ${product['style']}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Price: \$${product['price']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentSummaryScreen(product: product),
                  ),
                );
              },
              child: Text('Proceed to Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentSummaryScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  PaymentSummaryScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Summary'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Summary:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Name: ${product['name']}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Size: ${product['size']}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Color: ${product['color']}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Style: ${product['style']}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Price: \$${product['price']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(),
                  ),
                );
              },
              child: Text('Proceed to Payment'),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? _selectedPaymentMethod;
  String? _selectedMonth;
  String? _selectedYear;
  bool _cvvHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Payment Method',
                border: OutlineInputBorder(),
              ),
              items: ['Credit Card', 'Debit Card', 'UPI', 'Wallet', 'Cash on Delivery']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedPaymentMethod = newValue;
                });
              },
              value: _selectedPaymentMethod,
            ),
            SizedBox(height: 20),
            if (_selectedPaymentMethod == 'Credit Card' || _selectedPaymentMethod == 'Debit Card') ...[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Cardholder Name',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Expiry Month',
                        border: OutlineInputBorder(),
                      ),
                      items: List.generate(12, (index) => (index + 1).toString().padLeft(2, '0'))
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedMonth = newValue;
                        });
                      },
                      value: _selectedMonth,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Expiry Year',
                        border: OutlineInputBorder(),
                      ),
                      items: List.generate(10, (index) => (DateTime.now().year + index).toString())
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedYear = newValue;
                        });
                      },
                      value: _selectedYear,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'CVV',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_cvvHidden ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _cvvHidden = !_cvvHidden;
                      });
                    },
                  ),
                ),
                keyboardType: TextInputType.number,
                obscureText: _cvvHidden,
              ),
            ],
            if (_selectedPaymentMethod == 'UPI') ...[
              TextField(
                decoration: InputDecoration(
                  labelText: 'UPI ID',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
              ),
            ],
            if (_selectedPaymentMethod == 'Wallet') ...[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Wallet ID',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
              ),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle payment logic here
              },
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}