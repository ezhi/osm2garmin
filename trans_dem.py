import ogr2osm

class TransDemTranslation(ogr2osm.TranslationBase):
    def filter_tags(self, attrs):
        if not attrs:
            return
        if 'ele' in attrs:
            if float(attrs['ele']) % 500 == 0:
                return { 'ele':attrs['ele'], 'contour':'elevation', 'contour_ext':'major' }
            if float(attrs['ele']) % 100 == 0:
                return { 'ele':attrs['ele'], 'contour':'elevation', 'contour_ext':'int' }
            if float(attrs['ele']) % 50 == 0:
                return { 'ele':attrs['ele'], 'contour':'elevation', 'contour_ext':'minor' }
