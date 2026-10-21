# usage: python3 vectorize.py in.png out.svg [png_scale]
# جيد للنصوص والشعارات والرسومات بألوان مسطحة؛ الرسومات المائية بتطلع "مبوسترة"
import sys,vtracer
src,dst=sys.argv[1],sys.argv[2]
vtracer.convert_image_to_svg_py(src,dst,colormode='color',hierarchical='stacked',mode='spline',filter_speckle=4,color_precision=6,layer_difference=16,corner_threshold=60,length_threshold=4.0,splice_threshold=45,path_precision=3)
if len(sys.argv)>3:
    import cairosvg; cairosvg.svg2png(url=dst,write_to=dst[:-4]+'.png',scale=float(sys.argv[3]))
print('ok',dst)
