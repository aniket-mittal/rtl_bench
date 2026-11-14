// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 111;
  localparam OW = 73;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_125355 dut (
    .clk(clk),
    .rstn(in_vec[110:110]),
    .id_ex_rdy(in_vec[109:109]),
    .id_ex_op1(in_vec[108:77]),
    .id_ex_op2(in_vec[76:45]),
    .id_ex_funct(in_vec[44:39]),
    .id_ex_mem_st_data(in_vec[38:7]),
    .id_ex_mem_st_funct(in_vec[6:4]),
    .id_ex_mem_ld_funct(in_vec[3:1]),
    .ex_mem_ack(in_vec[0:0]),
    .id_ex_ack(out_vec[72:72]),
    .ex_mem_rdy(out_vec[71:71]),
    .ex_mem_alu_op(out_vec[70:70]),
    .ex_mem_st_data(out_vec[69:38]),
    .ex_mem_st_funct(out_vec[37:35]),
    .ex_mem_ld_funct(out_vec[34:32]),
    .ex_mem_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 111'h048505849e31f6d0060333bcb2d0;
    stim[1] = 111'h3441ae8e7705014741e957f5be29;
    stim[2] = 111'h6d23420b542aaa0afcd93b025519;
    stim[3] = 111'h692e61aee48f4bbb5cd4e7f26207;
    stim[4] = 111'h72a9c1a60321d34cd8a8f1a4939a;
    stim[5] = 111'h45290dd5da76b49700ba126c9ffe;
    stim[6] = 111'h7e05a5535acbd4d0d603b7b504ad;
    stim[7] = 111'h670d348a9d60e245accfee37d191;
    stim[8] = 111'h56573f7a1f851f1ffe4dcc136cc0;
    stim[9] = 111'h49ae2a21eb0207de602c73114990;
    stim[10] = 111'h6a817344ed25b359955caf1508e0;
    stim[11] = 111'h60f8287af32df8748aef9bc30106;
    stim[12] = 111'h451641b0bb3647f754916a561651;
    stim[13] = 111'h364694c9b52276ac966e0dba6a98;
    stim[14] = 111'h75ce8df100142a16226e05ce6118;
    stim[15] = 111'h44ef900c7ade918673bdac765a79;
    stim[16] = 111'h76f163427d1d6ad4d765e68ddac0;
    stim[17] = 111'h76316c632364dde1cc40d9b58370;
    stim[18] = 111'h66127383fb7dbf58d5c6b03e4ea9;
    stim[19] = 111'h6bce034b073046d645a1e4691873;
    stim[20] = 111'h544135541952d358b7af770b8585;
    stim[21] = 111'h43329848306540138715b7d99f40;
    stim[22] = 111'h6e14bf167f077733f1c36445d005;
    stim[23] = 111'h72c41e11b7c39e725c231aebce51;
    stim[24] = 111'h6cf493bc80aff5ea69c6be0494f7;
    stim[25] = 111'h741e7fa427225570c8ed278c397a;
    stim[26] = 111'h6a5d211bd297e539656967bbfb5b;
    stim[27] = 111'h717401061fa10fc363167980ccc0;
    stim[28] = 111'h4a08146f15cca3067cdc1c556d82;
    stim[29] = 111'h44d6077f3afc444b390b8951da0a;
    stim[30] = 111'h7b975cabbe2428a5d3e1b2eef73f;
    stim[31] = 111'h6af5558908bc9f3c996975bff89f;
    stim[32] = 111'h78a33fd80521c7a61726a25f390f;
    stim[33] = 111'h4eaaa580e692a79964a44b7b28ae;
    stim[34] = 111'h5d7c8f46fd4157367e35ef72927b;
    stim[35] = 111'h4678db74a5316b1db9f8538f4837;
    stim[36] = 111'h51a33c9904c99a34658d9ab212a1;
    stim[37] = 111'h4f1bb9cbd05446a3476b48512834;
    stim[38] = 111'h6d108604d4220f2b1ab2accda1e0;
    stim[39] = 111'h4487a36f72fde5676e8dd5fbf851;
    stim[40] = 111'h58ca3e2f36fa5c1c34c77194e9ab;
    stim[41] = 111'h57f2a47de7b1fd149eb57aa543c2;
    stim[42] = 111'h46042c3efb09611cbf56cc56bfb2;
    stim[43] = 111'h60b3393df2f49c910da4b0eedf33;
    stim[44] = 111'h6f8b6e3d840c81ebd41008e3ec35;
    stim[45] = 111'h75c4df4f599443547213dabcbff7;
    stim[46] = 111'h5cfeaea59b5793c87486d054c788;
    stim[47] = 111'h555603ce7367607225e954d7f7e4;
    stim[48] = 111'h7f5dd7194146e8899946e3562590;
    stim[49] = 111'h515d7d69f0a87a352be9245e57b9;
    stim[50] = 111'h4b984aa5aebb34f23fe4fc4dfe54;
    stim[51] = 111'h50986ea0e1957a2c61d74136da46;
    stim[52] = 111'h7eaac4698bc21ebf560c92a256dc;
    stim[53] = 111'h7dc6f41d3a8da8e2abd8b1ca5bc8;
    stim[54] = 111'h7b715557bcb7986f089dc15a960e;
    stim[55] = 111'h6bd699e591f9cf2808ec6a72b62e;
    stim[56] = 111'h60ed4bdcd6a2cd62a134181df2b8;
    stim[57] = 111'h784cf92c6e70c9d2ea310b0a81da;
    stim[58] = 111'h67415282fe9e006258464cee30e4;
    stim[59] = 111'h559e21581390d16ee7a7773c1092;
    stim[60] = 111'h6214533b3509fd9e7c620c761a46;
    stim[61] = 111'h527c8bfad2d4365eb569bd044973;
    stim[62] = 111'h64038a8cb146a2b40290055f99cc;
    stim[63] = 111'h7d590f765faaa17c105f03c913f9;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 73'h0000000000000000000;
      expv[1] = 73'h0000000000000000000;
      expv[2] = 73'h0000000000000000000;
      expv[3] = 73'h1ec9d812a8cxxxxxxxx;
      expv[4] = 73'h02c9d812a80xxxxxxxx;
      expv[5] = 73'h1d478d249cd00000000;
      expv[6] = 73'h1d478d249cd00000000;
      expv[7] = 73'h01478d249c000000000;
      expv[8] = 73'h1e7f71be8c800000000;
      expv[9] = 73'h1e7f71be8c800000000;
      expv[10] = 73'h1e7f71be8c800000000;
      expv[11] = 73'h1e7f71be8c800000000;
      expv[12] = 73'h1e7f71be8c800000000;
      expv[13] = 73'h0000000000000000000;
      expv[14] = 73'h0000000000000000000;
      expv[15] = 73'h1f702e7308c00000000;
      expv[16] = 73'h03702e7308000000000;
      expv[17] = 73'h1f2f346ed6000204080;
      expv[18] = 73'h1f2f346ed6000204080;
      expv[19] = 73'h032f346ed4000204080;
      expv[20] = 73'h1d0f2348c3900000000;
      expv[21] = 73'h010f2348c0000000000;
      expv[22] = 73'h010f2348c0000000000;
      expv[23] = 73'h1d0f2348c0200000000;
      expv[24] = 73'h010f2348c0000000000;
      expv[25] = 73'h1e35f024a7b00000000;
      expv[26] = 73'h1e35f024a7b00000000;
      expv[27] = 73'h0235f024a4000000000;
      expv[28] = 73'h1cb3cc0666000000000;
      expv[29] = 73'h1cb3cc0666000000000;
      expv[30] = 73'h1cb3cc0666000000000;
      expv[31] = 73'h00b3cc0664000000000;
      expv[32] = 73'h1f4badffc4f00000001;
      expv[33] = 73'h034badffc4000000001;
      expv[34] = 73'h034badffc4000000001;
      expv[35] = 73'h034badffc4000000001;
      expv[36] = 73'h034badffc4000000001;
      expv[37] = 73'h034badffc4000000001;
      expv[38] = 73'h034badffc4000000001;
      expv[39] = 73'h1d95666d0f000000000;
      expv[40] = 73'h0195666d0c000000000;
      expv[41] = 73'h0195666d0c000000000;
      expv[42] = 73'h0195666d0c000000000;
      expv[43] = 73'h0195666d0c000000000;
      expv[44] = 73'h1d258776f9900000000;
      expv[45] = 73'h01258776f8000000000;
      expv[46] = 73'h1c9ed5e5ffb00000000;
      expv[47] = 73'h1c9ed5e5ffb00000000;
      expv[48] = 73'h1c9ed5e5ffb00000000;
      expv[49] = 73'h1c9ed5e5ffb00000000;
      expv[50] = 73'h009ed5e5fc000000000;
      expv[51] = 73'h009ed5e5fc000000000;
      expv[52] = 73'h009ed5e5fc000000000;
      expv[53] = 73'h1c649512b6e00000000;
      expv[54] = 73'h1c649512b6e00000000;
      expv[55] = 73'h1c649512b6e00000000;
      expv[56] = 73'h1c649512b6e00000000;
      expv[57] = 73'h1c649512b6e00000000;
      expv[58] = 73'h1c649512b6e00000000;
      expv[59] = 73'h1c649512b6e00000000;
      expv[60] = 73'h1c649512b6e00000000;
      expv[61] = 73'h1c649512b6e00000000;
      expv[62] = 73'h00649512b4000000000;
      expv[63] = 73'h1c802afcce600000000;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
