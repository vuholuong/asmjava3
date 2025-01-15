package daos;

import java.util.List;

public interface DAO<E,K> {
	List<E> selectAll();
	E selectById(K id);
	void insert(E record);
	void delete(K id);
	void update(E record);
}
