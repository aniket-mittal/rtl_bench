// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 72;
  localparam OW = 71;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_068992 dut (
    .clock(clk),
    .reset(in_vec[71:71]),
    .me_reg_write(in_vec[70:70]),
    .me_mem_to_reg(in_vec[69:69]),
    .me_mem_read_data(in_vec[68:37]),
    .me_alu_result(in_vec[36:5]),
    .me_rt_rd(in_vec[4:0]),
    .wb_reg_write(out_vec[70:70]),
    .wb_mem_to_reg(out_vec[69:69]),
    .wb_data_memory(out_vec[68:37]),
    .wb_alu_result(out_vec[36:5]),
    .wb_rt_rd(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 72'hb7a8a045be88ddb974;
    stim[1] = 72'h94b234bfae21f33487;
    stim[2] = 72'h6b88f2615513e3b512;
    stim[3] = 72'h4c9b37748530459630;
    stim[4] = 72'h7ab9d0f63a899ec87a;
    stim[5] = 72'h4b0232d35742a0016b;
    stim[6] = 72'h339c7de796e95133ce;
    stim[7] = 72'h53a8b86a4b51c03229;
    stim[8] = 72'h79e43496aff3adfa90;
    stim[9] = 72'h354662eebc71affd87;
    stim[10] = 72'h56d57d6c1f2256bc24;
    stim[11] = 72'h336aee1f791d8bb9c6;
    stim[12] = 72'h3cf1d93bf2626d77e3;
    stim[13] = 72'h1bf2ad58164921cf56;
    stim[14] = 72'h5cd5eb1df9fe92cd15;
    stim[15] = 72'h0b20f2d996f9cc7520;
    stim[16] = 72'h77276d00cbc5f3fcbf;
    stim[17] = 72'h04da402a89bce1ea97;
    stim[18] = 72'h201fae258506b746fa;
    stim[19] = 72'h3e8c3f85a4e4a791b1;
    stim[20] = 72'h31786cedccc1239b6b;
    stim[21] = 72'h796529de64a561fffa;
    stim[22] = 72'h5581d7071535aec4ed;
    stim[23] = 72'h2237cabc4d161b5e4b;
    stim[24] = 72'h5c1de07ac89fc27fed;
    stim[25] = 72'h1f3d1c6978cab5f7f9;
    stim[26] = 72'h735703076db2d513aa;
    stim[27] = 72'h538312d65768178ad2;
    stim[28] = 72'h0ca156ca11800390b3;
    stim[29] = 72'hce7db84c9aac2b2bd8;
    stim[30] = 72'h1758e878983295f691;
    stim[31] = 72'h3d70fa090c45fc3c23;
    stim[32] = 72'h6a6e235f9c163ade81;
    stim[33] = 72'h31e8e6bda165964295;
    stim[34] = 72'h2dac989378941e44a4;
    stim[35] = 72'h4406e6a4c1419083c9;
    stim[36] = 72'h27c935bf9a5a28adf0;
    stim[37] = 72'h437a0152407eb0e9eb;
    stim[38] = 72'h72ea2509b08aa0a388;
    stim[39] = 72'h707be77b483023d6dd;
    stim[40] = 72'h5d475cf0ab5f65b58c;
    stim[41] = 72'h667161e118f2622a35;
    stim[42] = 72'h127597a71d088b2123;
    stim[43] = 72'h2be51ce1d88b6e0991;
    stim[44] = 72'h35edb02f8f1087468f;
    stim[45] = 72'h06bf614b82fabae856;
    stim[46] = 72'h73b1bf547f7d61f9ab;
    stim[47] = 72'h4368915ec00dbec7cf;
    stim[48] = 72'h1ef60a293fe2d28dbc;
    stim[49] = 72'h67c5a4639fa942b9a4;
    stim[50] = 72'h5c6a51afe9f8ac9cc1;
    stim[51] = 72'h252d8b41e9ab9f135f;
    stim[52] = 72'h33cd353f9314a94cd6;
    stim[53] = 72'h5568e474a2b409e193;
    stim[54] = 72'h29c5b2dc4b7a3dda9f;
    stim[55] = 72'h1972d2ce0d6c1ba5ad;
    stim[56] = 72'h320e4fdf9259f4f4b4;
    stim[57] = 72'h0dd18ce9a1f904fe4b;
    stim[58] = 72'h27709cff110f40a9e2;
    stim[59] = 72'h1749bd9502529dfefb;
    stim[60] = 72'h7432239189f6a93317;
    stim[61] = 72'h075318f4ee5da6b630;
    stim[62] = 72'h34033e559a62d5a771;
    stim[63] = 72'h7cbfc03ce0c443d0b0;
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
      expv[0] = 71'h000000000000000000;
      expv[1] = 71'h000000000000000000;
      expv[2] = 71'h000000000000000000;
      expv[3] = 71'h6b88f2615513e3b512;
      expv[4] = 71'h4c9b37748530459630;
      expv[5] = 71'h7ab9d0f63a899ec87a;
      expv[6] = 71'h4b0232d35742a0016b;
      expv[7] = 71'h339c7de796e95133ce;
      expv[8] = 71'h53a8b86a4b51c03229;
      expv[9] = 71'h79e43496aff3adfa90;
      expv[10] = 71'h354662eebc71affd87;
      expv[11] = 71'h56d57d6c1f2256bc24;
      expv[12] = 71'h336aee1f791d8bb9c6;
      expv[13] = 71'h3cf1d93bf2626d77e3;
      expv[14] = 71'h1bf2ad58164921cf56;
      expv[15] = 71'h5cd5eb1df9fe92cd15;
      expv[16] = 71'h0b20f2d996f9cc7520;
      expv[17] = 71'h77276d00cbc5f3fcbf;
      expv[18] = 71'h04da402a89bce1ea97;
      expv[19] = 71'h201fae258506b746fa;
      expv[20] = 71'h3e8c3f85a4e4a791b1;
      expv[21] = 71'h31786cedccc1239b6b;
      expv[22] = 71'h796529de64a561fffa;
      expv[23] = 71'h5581d7071535aec4ed;
      expv[24] = 71'h2237cabc4d161b5e4b;
      expv[25] = 71'h5c1de07ac89fc27fed;
      expv[26] = 71'h1f3d1c6978cab5f7f9;
      expv[27] = 71'h735703076db2d513aa;
      expv[28] = 71'h538312d65768178ad2;
      expv[29] = 71'h000000000000000000;
      expv[30] = 71'h000000000000000000;
      expv[31] = 71'h1758e878983295f691;
      expv[32] = 71'h3d70fa090c45fc3c23;
      expv[33] = 71'h6a6e235f9c163ade81;
      expv[34] = 71'h31e8e6bda165964295;
      expv[35] = 71'h2dac989378941e44a4;
      expv[36] = 71'h4406e6a4c1419083c9;
      expv[37] = 71'h27c935bf9a5a28adf0;
      expv[38] = 71'h437a0152407eb0e9eb;
      expv[39] = 71'h72ea2509b08aa0a388;
      expv[40] = 71'h707be77b483023d6dd;
      expv[41] = 71'h5d475cf0ab5f65b58c;
      expv[42] = 71'h667161e118f2622a35;
      expv[43] = 71'h127597a71d088b2123;
      expv[44] = 71'h2be51ce1d88b6e0991;
      expv[45] = 71'h35edb02f8f1087468f;
      expv[46] = 71'h06bf614b82fabae856;
      expv[47] = 71'h73b1bf547f7d61f9ab;
      expv[48] = 71'h4368915ec00dbec7cf;
      expv[49] = 71'h1ef60a293fe2d28dbc;
      expv[50] = 71'h67c5a4639fa942b9a4;
      expv[51] = 71'h5c6a51afe9f8ac9cc1;
      expv[52] = 71'h252d8b41e9ab9f135f;
      expv[53] = 71'h33cd353f9314a94cd6;
      expv[54] = 71'h5568e474a2b409e193;
      expv[55] = 71'h29c5b2dc4b7a3dda9f;
      expv[56] = 71'h1972d2ce0d6c1ba5ad;
      expv[57] = 71'h320e4fdf9259f4f4b4;
      expv[58] = 71'h0dd18ce9a1f904fe4b;
      expv[59] = 71'h27709cff110f40a9e2;
      expv[60] = 71'h1749bd9502529dfefb;
      expv[61] = 71'h7432239189f6a93317;
      expv[62] = 71'h075318f4ee5da6b630;
      expv[63] = 71'h34033e559a62d5a771;
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
