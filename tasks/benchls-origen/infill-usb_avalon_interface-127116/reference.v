module origen_127116 (
    input wire clk,
    input wire reset,
    input wire [7:0] address,
    input wire [7:0] writedata,
    input wire write,
    input wire read,
    input wire chipselect,
    input wire usbClk,
    input wire USBWireVPI,
    input wire USBWireVMI,
    
    output reg [7:0] readdata,
    output reg waitrequest,
    output reg irq,
    output reg USBWireVPO,
    output wire USBWireVMO,
    output wire USBWireDataOutTick,
    output wire USBWireOutEn_n,
    output wire USBFullSpeed
);

// Parameters
parameter IDLE = 2'b00;
parameter SETUP = 2'b01;
parameter DATA = 2'b10;
parameter STATUS = 2'b11;

// Internal registers
reg [1:0] state;
reg [7:0] buffer;
reg [3:0] bit_count;
reg [10:0] byte_count;

// Internal wires
wire data_valid;
wire data_ready;

// State machine
always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= IDLE;
        readdata <= 8'b0;
        waitrequest <= 1'b0;
        irq <= 1'b0;
        buffer <= 8'b0;
        bit_count <= 4'b0;
        byte_count <= 11'b0;
        USBWireVPO <= 1'b0;
    end else begin
        case (state)
            IDLE: begin
                if (chipselect && (read || write)) begin
                    state <= SETUP;
                    waitrequest <= 1'b1;
                end
            end
            SETUP: begin
                if (data_ready) begin
                    state <= DATA;
                    bit_count <= 4'b0;
                    byte_count <= 11'b0;
                end
            end
            DATA: begin
                if (read) begin
                    if (data_valid) begin
                        buffer <= {buffer[6:0], USBWireVPI};
                        bit_count <= bit_count + 1;
                        if (bit_count == 4'b0111) begin
                            readdata <= buffer;
                            byte_count <= byte_count + 1;
                            if (byte_count == address) begin
                                state <= STATUS;
                            end
                        end
                    end
                end else if (write) begin
                    USBWireVPO <= writedata[bit_count];
                    bit_count <= bit_count + 1;
                    if (bit_count == 4'b0111) begin
                        byte_count <= byte_count + 1;
                        if (byte_count == address) begin
                            state <= STATUS;
                        end
                    end
                end
            end
            STATUS: begin
                waitrequest <= 1'b0;
                irq <= 1'b1;
                state <= IDLE;
            end
        endcase
    end
end

// USB clock domain crossing
reg [1:0] usb_sync;
always @(posedge usbClk) begin
    usb_sync <= {usb_sync[0], clk};
end

assign data_valid = usb_sync[1] & ~usb_sync[0];
assign data_ready = ~usb_sync[1] & usb_sync[0];

// USB wire outputs
assign USBWireVMO = USBWireVMI;
assign USBWireDataOutTick = usbClk;
assign USBWireOutEn_n = (state == DATA && write) ? 1'b0 : 1'b1;
assign USBFullSpeed = 1'b1; // Assuming full-speed mode

endmodule