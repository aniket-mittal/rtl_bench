module rtlpp_01893 (
    input logic clk,
    input logic rst_n,
    input logic [7:0] indata,
    output logic [7:0] outdata
);

    // Internal signal definition
    logic [7:0] temp_data;

    // Example logic (from external module)
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            temp_data <= 8'b0;
        else
            temp_data <= indata;
    end

    assign outdata = temp_data;

endmodule