module origen_124008 (
    input wire clk,
    input wire rst,
    input wire enable,
    input wire [3:0] index,
    input wire [1:0] word,
    input wire comp,
    input wire write,
    input wire [4:0] tag_in,
    input wire [15:0] data_in,
    input wire valid_in,
    output reg hit,
    output reg dirty,
    output reg [4:0] tag_out,
    output reg [15:0] data_out,
    output reg valid
);

// Cache module interface
reg cache_enable;
reg cache_write;
reg [3:0] cache_index;
reg [1:0] cache_word;
reg [4:0] cache_tag_in;
reg [15:0] cache_data_in;
wire cache_hit;
wire cache_dirty;
wire [4:0] cache_tag_out;
wire [15:0] cache_data_out;
wire cache_valid;

// Memory module interface
reg mem_read;
reg mem_write;
reg [8:0] mem_address;
reg [15:0] mem_data_in;
wire [15:0] mem_data_out;

// State machine
reg [2:0] state;
localparam IDLE = 3'b000;
localparam READ = 3'b001;
localparam WRITE = 3'b010;
localparam MEMORY_READ = 3'b011;
localparam MEMORY_WRITE = 3'b100;

// Cache module instantiation
// Removed the cache module instantiation as it's provided as a black box

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= IDLE;
        hit <= 0;
        dirty <= 0;
        tag_out <= 0;
        data_out <= 0;
        valid <= 0;
        cache_enable <= 0;
        cache_write <= 0;
        cache_index <= 0;
        cache_word <= 0;
        cache_tag_in <= 0;
        cache_data_in <= 0;
        mem_read <= 0;
        mem_write <= 0;
        mem_address <= 0;
        mem_data_in <= 0;
    end else begin
        case (state)
            IDLE: begin
                if (enable) begin
                    cache_enable <= 1;
                    cache_index <= index;
                    cache_word <= word;
                    cache_tag_in <= tag_in;
                    if (write) begin
                        state <= WRITE;
                        cache_write <= 1;
                        cache_data_in <= data_in;
                    end else begin
                        state <= READ;
                        cache_write <= 0;
                    end
                end
            end

            READ: begin
                if (cache_hit) begin
                    hit <= 1;
                    dirty <= cache_dirty;
                    tag_out <= cache_tag_out;
                    data_out <= cache_data_out;
                    valid <= cache_valid;
                    state <= IDLE;
                end else begin
                    state <= MEMORY_READ;
                    mem_read <= 1;
                    mem_address <= {tag_in, index};
                end
            end

            WRITE: begin
                if (cache_hit) begin
                    hit <= 1;
                    dirty <= 1;
                    state <= IDLE;
                end else begin
                    state <= MEMORY_READ;
                    mem_read <= 1;
                    mem_address <= {tag_in, index};
                end
            end

            MEMORY_READ: begin
                mem_read <= 0;
                cache_write <= 1;
                cache_data_in <= mem_data_out;
                if (write) begin
                    state <= WRITE;
                end else begin
                    state <= READ;
                end
            end

            MEMORY_WRITE: begin
                mem_write <= 0;
                state <= MEMORY_READ;
            end

            default: state <= IDLE;
        endcase
    end
end

always @(*) begin
    if (state == MEMORY_WRITE) begin
        mem_write = 1;
        mem_address = {cache_tag_out, cache_index};
        mem_data_in = cache_data_out;
    end else begin
        mem_write = 0;
        mem_address = 0;
        mem_data_in = 0;
    end
end

endmodule