## Dosya Yapısı

### **lib/app/**
Uygulama genelindeki yapılandırmalar, rotalar ve uygulamanın kök widget'ı burada bulunur.

### **config/**
Uygulama ayarları ve teması burada bulunur.

### **navigation/**
Rota yönetimi ve navigasyon ayarları yapılır.

### **app.dart**
Uygulamanın ana widget'ıdır.

### **lib/core/**
Uygulama genelinde kullanılan sağlayıcılar, yardımcı sınıflar ve sabitler burada yer alır.

### **lib/features/**
Uygulamanın özellikleri veya modülleri burada bulunur.  
Her özellik kendi içinde şu katmanlara ayrılır:
- **presentation/**: Widgets, Pages ve UI bileşenleri.
- **application/**: State Notifiers, Providers ve iş mantığı.
- **domain/**: Entities, Use Cases ve temel iş kuralları.
- **infrastructure/**: Repository Implementations, Data Sources ve harici servis entegrasyonları.

### **lib/main.dart**
Uygulamanın giriş noktasıdır.