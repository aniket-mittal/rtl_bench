module origen_006527 #(
    parameter ADDR_WIDTH = 32,
    parameter EXPORT_ADDR_WIDTH = 32,
    parameter ADDRESS_SHIFT = 2,
    parameter NUM_BYTES = 4,
    parameter BURST_COUNT_WIDTH = 4
) (
    input wire clk,
    input wire reset,

    // Internal interface
    input  wire [ADDR_WIDTH-1:0]        address,
    input  wire                         read,
    input  wire                         write,
    input  wire [BURST_COUNT_WIDTH-1:0] burstcount,
    input  wire                         burstbegin,
    input  wire [NUM_BYTES-1:0]         byteenable,
    input  wire [DATA_WIDTH-1:0]        writedata,
    output wire [DATA_WIDTH-1:0]        readdata,
    output wire                         waitrequest,
    output wire                         readdatavalid,
    input  wire                         irq,

    // Export interface
    output wire [EXPORT_ADDR_WIDTH-1:0] export_address,
    output wire                         export_read,
    output wire                         export_write,
    output wire [BURST_COUNT_WIDTH-1:0] export_burstcount,
    output wire                         export_burstbegin,
    output wire [NUM_BYTES-1:0]         export_byteenable,
    output wire [DATA_WIDTH-1:0]        export_writedata,
    input  wire [DATA_WIDTH-1:0]        export_readdata,
    input  wire                         export_waitrequest,
    input  wire                         export_readdatavalid,
    output wire                         export_irq
);

    localparam DATA_WIDTH = NUM_BYTES * 8;

    // Address translation
    assign export_address = {address, {ADDRESS_SHIFT{1'b0}}};

    // Pass-through signals
    assign export_read = read;
    assign export_write = write;
    assign export_burstcount = burstcount;
    assign export_burstbegin = burstbegin;
    assign export_byteenable = byteenable;
    assign export_writedata = writedata;
    assign readdata = export_readdata;
    assign waitrequest = export_waitrequest;
    assign readdatavalid = export_readdatavalid;
    assign export_irq = irq;

endmodule