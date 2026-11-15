module origen_029148 #(
    parameter ROM_SIZE = 50,
    parameter AW = 5,
    parameter DW = 23
)(
    input wire clk,
    input wire reset,
    input wire clear_error,
    input wire ack,
    input wire transfer_complete,
    input wire [DW-1:0] rom_data,
    output reg [DW-1:0] data_out,
    output reg [AW-1:0] rom_address,
    output reg auto_init_complete,
    output reg auto_init_error
);

    reg transfer_data;
    wire toggle_next_transfer;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            rom_address <= {AW{1'b0}};
            auto_init_complete <= 1'b0;
            auto_init_error <= 1'b0;
            transfer_data <= 1'b0;
            data_out <= {DW{1'b0}};
        end else begin
            if (clear_error)
                auto_init_error <= 1'b0;
            
            if (!auto_init_complete && !auto_init_error) begin
                data_out <= rom_data;
                
                if (toggle_next_transfer) begin
                    if (rom_address == ROM_SIZE - 1) begin
                        auto_init_complete <= 1'b1;
                        transfer_data <= 1'b0;
                    end else begin
                        rom_address <= rom_address + 1'b1;
                        transfer_data <= 1'b1;
                    end
                end else if (ack && transfer_data) begin
                    auto_init_error <= 1'b1;
                    transfer_data <= 1'b0;
                end else if (!transfer_data) begin
                    transfer_data <= 1'b1;
                end
            end
        end
    end

    assign toggle_next_transfer = transfer_data && transfer_complete;

endmodule