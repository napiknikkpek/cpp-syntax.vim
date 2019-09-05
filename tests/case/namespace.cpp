namespace {}
namespace foo {}
namespace foo::bar {
inline namespace v3 {}
}  // namespace foo::bar
using namespace foo;
using namespace foo::bar;
using namespace ::foo::bar;
namespace tt = foo::bar;
namespace tt = ::foo::bar;
