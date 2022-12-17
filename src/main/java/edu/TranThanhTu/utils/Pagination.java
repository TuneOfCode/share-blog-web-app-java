package edu.TranThanhTu.utils;

import java.util.ArrayList;
import java.util.List;

public class Pagination<E> {
    public int getTotalPages(List<E> datas, int offset) {
	int size = datas.size();
	double totalPages = (double) size / offset;
	return (int) Math.ceil(totalPages);
    }

    public List<E> paginate(int page, int limit, List<E> datas) {
	System.out.println("=========== BEGIN ===========");
	List<E> result = new ArrayList<E>();
	if (page <= 0)
	    return null;
	if (limit <= 0)
	    return null;

	int index = (page - 1) * limit;
	System.out.println("currentIndex: " + index);
	System.out.println("page: " + page);
	System.out.println("pageSize: " + limit);
	int size = datas.size();
	System.out.println("size: " + size);
	int totalPages = this.getTotalPages(datas, limit);
	System.out.println("total pages: " + totalPages);
	int length = page * limit;

	if (length >= size) {
	    length = size;
	}

	System.out.println("Length: " + length);
	for (int i = index; i < length; i++) {
	    result.add(datas.get(i));
	}
	System.out.println("=========== END ===========");
	return result;
    }
}
