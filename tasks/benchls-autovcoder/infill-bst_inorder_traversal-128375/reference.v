module autovcoder_128375 (
    input wire clk,
    input wire rst,
    input wire insert_valid,
    input wire [3:0] insert_value,
    output reg [3:0] out_value,
    output reg out_valid
);

    // Node structure for the BST
    reg [3:0] data;
    reg [3:0] left;
    reg [3:0] right;
    reg [3:0] temp_value;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset the tree
            data <= 4'b0;
            left <= 4'b0;
            right <= 4'b0;
            out_valid <= 1'b0;
        end else if (insert_valid) begin
            // Insert operation
            if (data == 4'b0) begin
                data <= insert_value; // Insert at root
            end else begin
                if (insert_value < data) begin
                    left <= insert_value; // Insert in left subtree
                end else begin
                    right <= insert_value; // Insert in right subtree
                end
            end
        end
    end

    // In-order traversal
    always @(posedge clk) begin
        out_valid <= 1'b0;
        if (left != 4'b0) begin
            out_value <= left;
            out_valid <= 1'b1;
        end else if (data != 4'b0) begin
            out_value <= data;
            out_valid <= 1'b1;
        end else if (right != 4'b0) begin
            out_value <= right;
            out_valid <= 1'b1;
        end
    end
endmodule