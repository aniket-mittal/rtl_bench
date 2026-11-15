module plc_list (
    input  wire                     clk,
    input  wire                     rst,
    input  wire [2*ADDR_WIDTH-1:0]  add_addr_tuple,     
    input  wire [2*WAY_WIDTH-1:0]   add_way_tuple,       
    input  wire                     add_flag,           
    input  wire [ADDR_WIDTH-1:0]    store_addr,         
    input  wire [WAY_WIDTH-1:0]     store_addr_w,       
    input  wire                     store_flag,         
    input  wire                     fetch_flag,         

    output reg                      add_done,           
    output reg                      store_done,         
    output reg                      fetch_done,         
    output reg  [2*ADDR_WIDTH-1:0]  fetch_addr_tuple,   
    output reg  [2*WAY_WIDTH-1:0]   fetch_way_tuple,    
    output reg                      fetch_none,         
    output wire                     req_error,
    output reg                      plc_check_flag,     
    output reg                      last_flag
);

    parameter LIST_CAP = 32;
    parameter LIST_CAP_BITS = 5;
    parameter ADDR_WIDTH = 8;
    parameter WAY_WIDTH = 4;

    reg [2*ADDR_WIDTH-1:0]  list [LIST_CAP-1:0];
    reg [2*WAY_WIDTH-1:0]   ways [LIST_CAP-1:0];
    
    reg [LIST_CAP-1:0]      store_counter;
    reg [LIST_CAP_BITS-1:0] size;
    reg [LIST_CAP_BITS-1:0] fetch_ptr;
    reg                     list_full;

    reg                     add_error, store_error;

    integer i;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < LIST_CAP; i = i+1) begin
                list[i] <= 'd0;
                ways[i] <= 'd0;
            end
            size <= 'd0;
            list_full <= 1'b0;
            add_done  <= 1'b0;
            add_error <= 1'b0;
        end else if (add_flag) begin    
            if (~list_full) begin
                list[size] <= add_addr_tuple;
                ways[size] <= add_way_tuple;
                list_full  <= (size == 'hffff_ffff_ffff_ffff) ? 1'b1 : 1'b0;
                size <= size + 1;
                add_done  <= 1'b1;
                add_error <= 1'b0;
            end else begin
                add_done <= 1'b1;
                add_error <= 1'b1;
            end
        end else begin
            add_done <= 1'b0;
        end
    end

    always @(*) begin
        last_flag = (fetch_ptr == size);
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            fetch_addr_tuple <= 0;
            fetch_way_tuple <= 0;
            fetch_ptr  <= 'd0;
            fetch_done <= 1'b0;
            fetch_none <= 1'b0;
        end else if (plc_check_flag) begin
            fetch_addr_tuple <= list[0];
            fetch_way_tuple <= ways[0];
            fetch_ptr <= 'd1;
            fetch_done <= 1'b1;
            fetch_none <= 1'b0;
        end else if (fetch_flag) begin
            if (fetch_ptr != size) begin    
                fetch_addr_tuple <= list[fetch_ptr];
                fetch_way_tuple  <= ways[fetch_ptr];
                fetch_ptr  <= fetch_ptr + 'd1;
                fetch_done <= 1'b1;
                fetch_none <= 1'b0;
            end else begin
                fetch_addr_tuple <= fetch_addr_tuple;
                fetch_way_tuple  <= fetch_way_tuple;
                fetch_ptr  <= 'd0;
                fetch_done <= 1'b1;
                fetch_none <= 1'b1;
            end
        end else begin
            fetch_done <= 1'b0;
        end
    end

    wire [ADDR_WIDTH-1:0] search_addr = store_addr;
    wire [WAY_WIDTH-1:0]  search_way  = store_addr_w;
    wire                  search_hit = |search_result;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            store_counter <= 'd0;
            plc_check_flag <= 1'b0;
            store_done <= 1'b0;
            store_error <= 1'b0;
        end else if (store_flag) begin
            store_done <= 1'b1;
            if (search_hit) begin
                store_counter <= store_counter ^ search_result;
                plc_check_flag <= !(|(store_counter ^ search_result));
            end else begin
                plc_check_flag <= 1'b0;
            end
        end else begin
            plc_check_flag <= 1'b0;
            store_done <= 1'b0;
        end
    end

    genvar g;
    wire [LIST_CAP-1:0] search_result;
    generate
        for (g = 0; g < LIST_CAP; g = g+1) begin: SEARCH
            assign search_result[g] = store_flag & (((list[g][2*ADDR_WIDTH-1:ADDR_WIDTH] == search_addr) &&
                                    (ways[g][2*WAY_WIDTH-1:WAY_WIDTH] == search_way)) ||
                                ((list[g][ADDR_WIDTH-1:0] == search_addr) &&
                                    (ways[g][2*WAY_WIDTH-1:0] == search_way)));
        end
    endgenerate

    assign req_error = | {
        add_error,
        store_error,
        ~((add_flag ^ fetch_flag) ^ (add_flag ^ store_flag) ^ (fetch_flag ^ store_flag))
    };

endmodule