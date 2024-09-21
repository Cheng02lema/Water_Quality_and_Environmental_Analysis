function safeCrossing(m, n, k)
    initial_state = [m, n, 1]; % 初始状态，左岸有 m 个商人，n 个仆人，船在左岸
    final_state = [0, 0, 0]; % 最终状态，左岸没有商人和仆人，船在右岸
    path = dfs(initial_state, final_state, [], k);
    disp('Safe crossing path:');
    disp(path);
end

function path = dfs(state, final_state, visited, k)
    if isequal(state, final_state)
        path = visited;
        return;
    end
    
    visited = [visited; state];
    
    m = state(1);
    n = state(2);
    boat = state(3);
    
    % 可以选择的动作：带商人过河、带仆人过河、空船过河
    actions = [
        [-1, 0, -1]; % 带一个商人过河
        [0, -1, -1]; % 带一个仆人过河
        [-1, -1, -1]; % 带一个商人和一个仆人过河
        [1, 0, 1]; % 带一个商人回左岸
        [0, 1, 1]; % 带一个仆人回左岸
        [1, 1, 1]; % 带一个商人和一个仆人回左岸
        [0, 0, 1]; % 空船过河
    ];
    
    % 尝试每种动作
    for i = 1:size(actions, 1)
        next_state = state + actions(i, :);
        
        % 检查下一个状态是否合法
        if all(next_state >= 0) && all(next_state(1:2) <= [m, n]) && next_state(1)+next_state(2)<=k
            path = dfs(next_state, final_state, visited, k);
            if ~isempty(path)
                return;
            end
        end
    end
    
    path = []; % 无法找到安全路径
end