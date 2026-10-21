import sys,time
from rembg import remove,new_session
from PIL import Image
src,dst=sys.argv[1],sys.argv[2]; m=sys.argv[3] if len(sys.argv)>3 else 'isnet-general-use'
t=time.time(); s=new_session(m)
out=remove(Image.open(src),session=s); out.save(dst); print(m,'%.1fs'%(time.time()-t))
