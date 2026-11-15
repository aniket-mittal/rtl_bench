module rtlpp_03035 (
    input wire                        clk,       
    input wire                        reset,     
    
    input  wire [31:0]                insn,      
    output wire [31:0]                if_pc,     
    input  wire                       data_rdy,  

    input  wire                       stall,     
    input  wire                       flush,     
    input  wire [31:0]                new_pc,    
    input  wire                       cache_miss,
    input  wire [3:0]                 cm_hart_id,
    input  wire [31:0]                cm_addr,        
    input  wire [3:0]                 br_hart_id,
    input  wire                       br_taken,  
    input  wire [31:0]                br_addr,   

    input  wire [3:0]                 hart_id,   
    input  wire                       id_hstart, 
    input  wire                       id_hidle,  
    input  wire [3:0]                 id_hs_id,  
    input  wire [31:0]                id_hs_pc,  

    output reg  [31:0]                pc,        
    output reg  [31:0]                if_npc,    
    output reg  [31:0]                if_insn,   
    output reg                        if_en,     
    output reg  [3:0]                 if_hart_id 
);

    reg  [31:0] if_pcs [0:15];    
    assign if_pc = if_pcs[hart_id];

    wire [31:0] npc;
    assign npc = if_pcs[hart_id] + 32'd4;

    always @(posedge clk) begin
        if (reset) begin
            pc              <= 32'h0;
            if_npc          <= 32'h0;
            if_pcs[hart_id] <= 32'h0;
            if_insn         <= 32'h00000013;  // NOP instruction
            if_en           <= 1'b0;
            if_hart_id      <= 4'h0;
        end else begin
            if (!stall) begin
                if (id_hstart && id_hidle && hart_id != id_hs_id) begin
                    if_pcs[id_hs_id] <= id_hs_pc;    
                end
                if (flush) begin
                    pc                 <= 32'h0;
                    if_npc             <= 32'h0;
                    if_pcs[hart_id]    <= new_pc;
                    if_insn            <= 32'h00000013;  // NOP instruction
                    if_en              <= 1'b0;
                    if_hart_id         <= hart_id;
                end else if (br_taken) begin
                    if (hart_id == br_hart_id) begin
                        pc              <= 32'h0;
                        if_npc          <= 32'h0;
                        if_pcs[hart_id] <= br_addr;
                        if_insn         <= 32'h00000013;  // NOP instruction
                        if_en           <= 1'b0;
                        if_hart_id      <= 4'h0;
                    end else begin
                        pc              <= if_pcs[hart_id];
                        if_npc          <= npc;
                        if_pcs[hart_id] <= npc;
                        if_pcs[br_hart_id] <= br_addr;
                        if_insn        <= insn;
                        if_en          <= 1'b1;
                        if_hart_id     <= hart_id;
                    end
                end else if (cache_miss) begin
                    if_hart_id         <= hart_id;
                    if (cm_hart_id == hart_id) begin
                        pc              <= if_pcs[hart_id];
                        if_npc          <= npc;
                        if_pcs[hart_id] <= cm_addr;
                        if_insn        <= 32'h00000013;  // NOP instruction
                        if_en          <= 1'b0;
                    end else begin
                        pc              <= if_pcs[hart_id];
                        if_npc          <= npc;
                        if_pcs[hart_id] <= npc;
                        if_pcs[cm_hart_id] <= cm_addr;
                        if_insn        <= insn;
                        if_en          <= 1'b1;
                    end
                end else begin
                    if (data_rdy) begin
                        pc              <= if_pcs[hart_id];
                        if_npc          <= npc;
                        if_pcs[hart_id] <= npc;
                        if_insn        <= insn;
                        if_en          <= 1'b1;
                        if_hart_id     <= hart_id;
                    end else begin
                        if_en          <= 1'b0;
                    end
                end
            end
        end
    end

endmodule