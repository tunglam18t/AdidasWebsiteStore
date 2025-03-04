# AdidasWebsiteStore
📌 Project Overview: 
Dự án này phân tích dữ liệu Adidas Website Store bằng SQL Server, tập trung vào phân phối sản phẩm, giá cả, tính khả dụng và xu hướng bán hàng. Bộ dữ liệu bao gồm shoes_dim (chi tiết sản phẩm) và shoes_fact (dữ liệu bán hàng và kho).
📂 Key Analyses & Insights
1️⃣ **Distribution of Adidas Products by Category** - Mục tiêu: Xác định phân khúc sản phẩm của Adidas dựa trên danh mục sử dụng.
## Distribution of Adidas Products by Category
| **Best For Wear**  | **Total** | **Percentage (%)** |  
|-------------------|--------|----------------|  
| Neutral          | 1,153  | 34.92%         |  
| Racing          | 304    | 9.21%          |  
| Everyday        | 222    | 6.72%          |  
| Comfort        | 182    | 5.51%          |  
| Walking        | 180    | 5.45%          |  
| Day Hiking     | 123    | 3.73%          |  
| City           | 112    | 3.39%          |  
| Off-Court      | 108    | 3.27%          |  
| Padel Tennis   | 105    | 3.18%          |  
| Stability      | 53     | 1.61%          |  
Insight: Adidas tập trung vào các dòng giày trung tính, phù hợp với nhiều đối tượng và nhu cầu khác nhau. Ngoài ra, các dòng giày chuyên dụng như Racing (chạy) và Everyday (sử dụng hàng ngày) cũng có số lượng lớn, cho thấy họ chú trọng đến sự đa dạng trong phân khúc khách hàng.

2️⃣ **Gender Target Analysis** - Mục tiêu: Xác định phân khúc giới tính nào mà giày Adidas hướng đến nhiều nhất.
## 📊 Gender Distribution of Adidas Products  

| **Gender**  | **Total** | **Percentage (%)** |  
|------------|--------|----------------|  
| Unisex     | 1,134  | 34%            |  
| Women      | 1,014  | 30%            |  
| Kid        | 713    | 21%            |  
| Men        | 441    | 13%            |  
Insight: Đối với phân tích về phân khúc khách hàng, Adidas đang tối ưu hóa sản phẩm theo xu hướng phi giới tính (Unisex), điều này phù hợp với chiến lược thiết kế hiện đại, tiếp cận cả nam lẫn nữ. Bên cạnh đó, sự tập trung vào phụ nữ (30%) cho thấy Adidas đang đẩy mạnh phân khúc nữ giới hơn nam giới.

3️⃣ **Most Common Color Sets**- Mục tiêu: Xác định các phối màu được sử dụng thường xuyên nhất trong các sản phẩm của Adidas.
## Most Used Adidas Color Sets

| Adidas Color Set                          | Total Set |
|-------------------------------------------|-----------|
| Core Black - Cloud White - Core Black     | 83        |
| Core Black - Core Black - Core Black      | 70        |
| Core Black - Core Black - Cloud White     | 46        |
| Core Black - Zero Metallic - Spark        | 46        |
| Core Black - Core Black - Grey Four       | 40        |
| Core Black - Cloud White - Cloud White    | 35        |
| Core Black - Core Black - Carbon          | 33        |
| Cloud White - Cloud White - Cloud White   | 32        |
| Core Black - Core Black - Grey Six        | 30        |
| Core Black - Cloud White - Carbon         | 28        |

Insight: Sản phẩm Adidas chủ yếu có màu **đen - trắng**, phản ánh sở thích chung của khách hàng.

4️⃣ **Adidas Shoe Price Distribution** - Mục tiêu: Phân tích phối giá của các sản phẩm trên cửa hàng
## Price Range Distribution

| Price Range  | Total Product |
|-------------|---------------|
| 50$ - 100$  | 1489          |
| 0$ - 50$    | 1001          |
| 100$ - 200$ | 860           |
| 150$ - 200$ | 452           |
| 200$ - 300$ | 181           |
| 300$ - 500$ | 30            |
Insights: Adidas có chiến lược giá tập trung vào phân khúc giày tầm trung và giá rẻ, phù hợp với đại đa số người tiêu dùng. Phân khúc cao cấp (200$ trở lên) có rất ít sản phẩm.

5️⃣ **Category Distribution** - Mục tiêu: Xác định danh mục sản phẩm nào chiếm ưu thế trong các sản phẩm của Adidas
## Adidas Product Category Distribution

| Category            | Percentage (%) |
|---------------------|---------------|
| Running Shoes      | 26            |
| Sneakers          | 24            |
| Outdoor Shoes     | 14            |
| Walking Shoes     | 10            |
| Athletic Sneakers | 6             |

Insight: Giày chạy bộ và giày thể thao vẫn luôn chiếm tỷ trọng lớn đối với adidas bên cạnh đó còn có các loại Giày Outdoor khác.

6️⃣ **Shoe Size Analysis (US & EU sizes)** - Mục tiêu: So sánh các Size Category (EU, US, Oher) hiện có của Adidas.
## Shoe Size Distribution

| Category  | Percentage (%) |
|-----------|---------------|
| US Size  | 14            |
| EU Size  | 60            |
| Other    | 25            |

Insights: Đa số các sản phẩm được điều chỉnh và thiết kế dựa trêu EU Size. Thị trường Mỹ có thể chưa phải là ưu tiên lớn nhất của hãng cho kích thước giày.
