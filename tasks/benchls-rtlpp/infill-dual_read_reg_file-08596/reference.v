module rtlpp_08596 (
    input         rst_n,
    input         clk,
    
    input         read_a_enable,
    input [3:0]   read_a_select,
    output reg [31:0] read_a_value,
    
    input         read_b_enable,
    input [3:0]   read_b_select,
    output reg [31:0] read_b_value,
    
    input         write_enable,
    input [3:0]   write_select,
    input [31:0]  write_value
);

    reg [31:0] register[0:15];
    
    // Internal combinational logic to read register values
    wire [31:0] read_a_data = (read_a_select == 0) ? 32'd0 : register[read_a_select];
    wire [31:0] read_b_data = (read_b_select == 0) ? 32'd0 : register[read_b_select];

    // Assign read_a_value and read_b_value conditionally based on enables
    always @(*) begin
        if (read_a_enable)
            read_a_value = read_a_data;
        else
            read_a_value = 32'hzzzzzzzz;
    end

    always @(*) begin
        if (read_b_enable)
            read_b_value = read_b_data;
        else
            read_b_value = 32'hzzzzzzzz;
    end

    // Write logic with synchronous reset and enable check
    integer n;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (n = 0; n < 16; n = n + 1) begin
                register[n] <= 32'd0;
            end
        end else if (write_enable) begin
            register[write_select] <= write_value;
        end
    end

endmodule