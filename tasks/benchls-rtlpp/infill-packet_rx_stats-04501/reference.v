module rtlpp_04501 
(
    clk,
    reset,
    address,
    write,
    read,
    writedata,
    readdata,
    rx_data,
    rx_dval,
    rx_sop,
    rx_eop,
    rx_mod,
    rx_err,
    rx_rdy
);

input   clk;                    
input   reset;                  
input   [2:0] address;              
input   write;                  
input   read;                   
input   [31:0] writedata;           
output  [31:0] readdata;            
input   [31:0] rx_data;             
input   rx_dval;                
input   rx_sop;                    
input   rx_eop;                    
input   [1:0] rx_mod;              
input   [5:0] rx_err;              
output  rx_rdy;                    

reg [31:0] readdata;
reg  rx_rdy;

reg  [31:0] number_packet;         
reg [31:0] packet_rx_ok;           
reg [31:0] packet_rx_error;        
reg [63:0] byte_rx_count;          
reg [63:0] cycle_rx_count;         
reg  [31:0] receive_ctrl_status;       

wire [21:0] receive_ctrl_status_wire;
wire start;
wire stop;
wire rx_done;

wire crcbad;
wire crcvalid;

always @ (posedge clk or posedge reset)
    begin
        if (reset)
            number_packet <= 32'h0;
        else if (write & address == 3'h0)
            number_packet <= writedata;
    end

always @ (posedge clk or posedge reset)
    begin
        if (reset)
            packet_rx_ok <= 32'h0;
        else if (start)
            packet_rx_ok <= 32'h0;
        else if (~stop & crcvalid & ~crcbad)
            packet_rx_ok <= packet_rx_ok + 32'h1;
    end

always @ (posedge clk or posedge reset)
    begin
        if (reset)
            packet_rx_error <= 32'h0;
        else if (start)
            packet_rx_error <= 32'h0;
        else if (~stop & crcvalid & crcbad)
            packet_rx_error <= packet_rx_error + 32'h1;
    end

always @ (posedge clk or posedge reset)
    begin
        if (reset)
            byte_rx_count <= 64'h0;
        else if (start)
            byte_rx_count <= 64'h0;
        else if (~stop & rx_dval & rx_eop & rx_mod == 2'b01)
            byte_rx_count <= byte_rx_count + 64'h3;
        else if (~stop & rx_dval & rx_eop & rx_mod == 2'b10)
            byte_rx_count <= byte_rx_count + 64'h2;
        else if (~stop & rx_dval & rx_eop & rx_mod == 2'b11)
            byte_rx_count <= byte_rx_count + 64'h1;
        else if (~stop & rx_dval)
            byte_rx_count <= byte_rx_count + 64'h4;
    end

always @ (posedge clk or posedge reset)
    begin
        if (reset)
            cycle_rx_count <= 64'h0;
        else if (start)
            cycle_rx_count <= 64'h0;
        else if (~stop & ~rx_done & byte_rx_count > 64'h0)
            cycle_rx_count <= cycle_rx_count + 64'h1;
    end

assign receive_ctrl_status_wire = 22'h0;

always @ (receive_ctrl_status_wire)
    begin
        receive_ctrl_status[31:10] = receive_ctrl_status_wire;
    end

always @ (posedge clk or posedge reset)
    begin
        if (reset)
            receive_ctrl_status[9:0] <= 10'h0;
        else if (write & address == 3'h7)
            receive_ctrl_status[1:0] <= writedata[1:0];
        else if (start)
            receive_ctrl_status[2:0] <= 3'b000;
        else if (rx_eop)
            receive_ctrl_status[9:4] <= rx_err[5:0];
        else if (crcvalid)
            receive_ctrl_status[3] <= crcbad;
        else if ((packet_rx_ok + packet_rx_error) == number_packet)
            receive_ctrl_status[2] <= 1'b1;
    end

assign start = receive_ctrl_status[0];
assign stop = receive_ctrl_status[1];
assign rx_done = receive_ctrl_status[2];

always @ (read or address or number_packet or packet_rx_ok or packet_rx_error or receive_ctrl_status)
    begin    
        readdata = 0;
        if (read)
        begin
            case (address)
                3'h0: readdata = number_packet;
                3'h1: readdata = packet_rx_ok;
                3'h2: readdata = packet_rx_error;
                3'h3: readdata = byte_rx_count[31:0];
                3'h4: readdata = byte_rx_count[63:32];
                3'h5: readdata = cycle_rx_count[31:0];
                3'h6: readdata = cycle_rx_count[63:32];
                3'h7: readdata = receive_ctrl_status;
                default: readdata = 32'h0;
            endcase
        end
    end

always @ (posedge clk or posedge reset)
    begin
        if (reset)
            rx_rdy <= 1'b0;
        else 
            rx_rdy <= 1'b1;
    end

reg [31:0] crc32_reg;
reg crcbad_reg, crcvalid_reg;

always @ (posedge clk or negedge reset)
begin
    if (~reset) begin
        crc32_reg <= 32'hFFFFFFFF;
        crcvalid_reg <= 0;
        crcbad_reg <= 0;
    end else begin
        if (rx_sop)
            crc32_reg <= 32'hFFFFFFFF;
        if (rx_dval) begin
            crc32_reg <= nextCRC32_D32(rx_data, crc32_reg);
        end
        if (rx_eop) begin
            crcvalid_reg <= 1;
            crcbad_reg <= (crc32_reg != 32'hDEBB20E3); // Assuming 32'hDEBB20E3 is the expected CRC
        end else begin
            crcvalid_reg <= 0;
            crcbad_reg <= 0;
        end
    end
end

function [31:0] nextCRC32_D32;
    input [31:0] Data;
    input [31:0] crc;
    reg [31:0] D;
    reg [31:0] C;
    reg [31:0] NewCRC;
    begin
        D = Data;
        C = crc;
        NewCRC[0] = D[31] ^ C[24] ^ D[30] ^ C[23] ^ D[29] ^ C[22] ^ D[28] ^ C[21] ^ D[27] ^ C[20] ^ D[26] ^ C[19] ^ D[25] ^ C[18] ^ D[24] ^ C[17] ^ D[23] ^ C[16] ^ D[22] ^ C[15] ^ D[21] ^ C[14] ^ D[20] ^ C[13] ^ D[19] ^ C[12] ^ D[18] ^ C[11] ^ D[17] ^ C[10] ^ D[16] ^ C[9] ^ D[15] ^ C[8] ^ D[14] ^ C[7] ^ D[13] ^ C[6] ^ D[12] ^ C[5] ^ D[11] ^ C[4] ^ D[10] ^ C[3] ^ D[9] ^ C[2] ^ D[8] ^ C[1] ^ D[7] ^ C[0];
        NewCRC[1] = D[6] ^ C[31] ^ C[24] ^ D[31] ^ C[23] ^ D[30] ^ C[22] ^ D[29] ^ C[21] ^ D[28] ^ C[20] ^ D[27] ^ C[19] ^ D[26] ^ C[18] ^ D[25] ^ C[17] ^ D[24] ^ C[16] ^ D[23] ^ C[15] ^ D[22] ^ C[14] ^ D[21] ^ C[13] ^ D[20] ^ C[12] ^ D[19] ^ C[11] ^ D[18] ^ C[10] ^ D[17] ^ C[9] ^ D[16] ^ C[8] ^ D[15] ^ C[7] ^ D[14] ^ C[6] ^ D[13] ^ C[5] ^ D[12] ^ C[4] ^ D[11] ^ C[3] ^ D[10] ^ C[2] ^ D[9] ^ C[1] ^ D[8] ^ C[0] ^ D[7];
        NewCRC[2] = D[5] ^ C[31] ^ C[23] ^ D[31] ^ C[22] ^ D[30] ^ C[21] ^ D[29] ^ C[20] ^ D[28] ^ C[19] ^ D[27] ^ C[18] ^ D[26] ^ C[17] ^ D[25] ^ C[16] ^ D[24] ^ C[15] ^ D[23] ^ C[14] ^ D[22] ^ C[13] ^ D[21] ^ C[12] ^ D[20] ^ C[11] ^ D[19] ^ C[10] ^ D[18] ^ C[9] ^ D[17] ^ C[8] ^ D[16] ^ C[7] ^ D[15] ^ C[6] ^ D[14] ^ C[5] ^ D[13] ^ C[4] ^ D[12] ^ C[3] ^ D[11] ^ C[2] ^ D[10] ^ C[1] ^ D[9] ^ C[0] ^ D[8];
        NewCRC[3] = D[4] ^ C[31] ^ C[22] ^ D[31] ^ C[21] ^ D[30] ^ C[20] ^ D[29] ^ C[19] ^ D[28] ^ C[18] ^ D[27] ^ C[17] ^ D[26] ^ C[16] ^ D[25] ^ C[15] ^ D[24] ^ C[14] ^ D[23] ^ C[13] ^ D[22] ^ C[12] ^ D[21] ^ C[11] ^ D[20] ^ C[10] ^ D[19] ^ C[9] ^ D[18] ^ C[8] ^ D[17] ^ C[7] ^ D[16] ^ C[6] ^ D[15] ^ C[5] ^ D[14] ^ C[4] ^ D[13] ^ C[3] ^ D[12] ^ C[2] ^ D[11] ^ C[1] ^ D[10] ^ C[0] ^ D[9];
        NewCRC[4] = D[3] ^ C[31] ^ C[21] ^ D[31] ^ C[20] ^ D[30] ^ C[19] ^ D[29] ^ C[18] ^ D[28] ^ C[17] ^ D[27] ^ C[16] ^ D[26] ^ C[15] ^ D[25] ^ C[14] ^ D[24] ^ C[13] ^ D[23] ^ C[12] ^ D[22] ^ C[11] ^ D[21] ^ C[10] ^ D[20] ^ C[9] ^ D[19] ^ C[8] ^ D[18] ^ C[7] ^ D[17] ^ C[6] ^ D[16] ^ C[5] ^ D[15] ^ C[4] ^ D[14] ^ C[3] ^ D[13] ^ C[2] ^ D[12] ^ C[1] ^ D[11] ^ C[0] ^ D[10];
        NewCRC[5] = D[2] ^ C[31] ^ C[20] ^ D[31] ^ C[19] ^ D[30] ^ C[18] ^ D[29] ^ C[17] ^ D[28] ^ C[16] ^ D[27] ^ C[15] ^ D[26] ^ C[14] ^ D[25] ^ C[13] ^ D[24] ^ C[12] ^ D[23] ^ C[11] ^ D[22] ^ C[10] ^ D[21] ^ C[9] ^ D[20] ^ C[8] ^ D[19] ^ C[7] ^ D[18] ^ C[6] ^ D[17] ^ C[5] ^ D[16] ^ C[4] ^ D[15] ^ C[3] ^ D[14] ^ C[2] ^ D[13] ^ C[1] ^ D[12] ^ C[0] ^ D[11];
        NewCRC[6] = D[1] ^ C[31] ^ C[19] ^ D[31] ^ C[18] ^ D[30] ^ C[17] ^ D[29] ^ C[16] ^ D[28] ^ C[15] ^ D[27] ^ C[14] ^ D[26] ^ C[13] ^ D[25] ^ C[12] ^ D[24] ^ C[11] ^ D[23] ^ C[10] ^ D[22] ^ C[9] ^ D[21] ^ C[8] ^ D[20] ^ C[7] ^ D[19] ^ C[6] ^ D[18] ^ C[5] ^ D[17] ^ C[4] ^ D[16] ^ C[3] ^ D[15] ^ C[2] ^ D[14] ^ C[1] ^ D[13] ^ C[0] ^ D[12];
        NewCRC[7] = D[0] ^ C[31] ^ C[18] ^ D[31] ^ C[17] ^ D[30] ^ C[16] ^ D[29] ^ C[15] ^ D[28] ^ C[14] ^ D[27] ^ C[13] ^ D[26] ^ C[12] ^ D[25] ^ C[11] ^ D[24] ^ C[10] ^ D[23] ^ C[9] ^ D[22] ^ C[8] ^ D[21] ^ C[7] ^ D[20] ^ C[6] ^ D[19] ^ C[5] ^ D[18] ^ C[4] ^ D[17] ^ C[3] ^ D[16] ^ C[2] ^ D[15] ^ C[1] ^ D[14] ^ C;
        NewCRC = ((NewCRC << 8) | (D[7:0] << 0));
        nextCRC32_D32 = NewCRC;
    end
endfunction

assign crcbad = crcbad_reg;
assign crcvalid = crcvalid_reg;

endmodule