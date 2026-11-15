// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 44;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  flash8_r2 dut (
    .wb_clk_i(clk),
    .wb_rst_i(in_vec[30:30]),
    .wb_dat_i(in_vec[29:14]),
    .wb_we_i(in_vec[13:13]),
    .wb_adr_i(in_vec[12:12]),
    .wb_sel_i(in_vec[11:10]),
    .wb_stb_i(in_vec[9:9]),
    .wb_cyc_i(in_vec[8:8]),
    .flash_data_(in_vec[7:0]),
    .wb_dat_o(out_vec[43:28]),
    .wb_ack_o(out_vec[27:27]),
    .flash_addr_(out_vec[26:4]),
    .flash_we_n_(out_vec[3:3]),
    .flash_oe_n_(out_vec[2:2]),
    .flash_ce_n_(out_vec[1:1]),
    .flash_rst_n_(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h5f472f80;
    stim[1] = 31'h5b4c01ab;
    stim[2] = 31'h2266351e;
    stim[3] = 31'h3a99fa5c;
    stim[4] = 31'h0d59f803;
    stim[5] = 31'h17c49588;
    stim[6] = 31'h1f76190e;
    stim[7] = 31'h36cb686b;
    stim[8] = 31'h20de28a5;
    stim[9] = 31'h3aa22103;
    stim[10] = 31'h3d832f53;
    stim[11] = 31'h3f7a03d8;
    stim[12] = 31'h15935ad4;
    stim[13] = 31'h230f6ae2;
    stim[14] = 31'h0099d3c7;
    stim[15] = 31'h0c58dab7;
    stim[16] = 31'h015a264b;
    stim[17] = 31'h1048b8bc;
    stim[18] = 31'h04f5c8a9;
    stim[19] = 31'h73bd542f;
    stim[20] = 31'h1ed2e80d;
    stim[21] = 31'h1337fa59;
    stim[22] = 31'h199c5b76;
    stim[23] = 31'h1f0183cb;
    stim[24] = 31'h18d8d414;
    stim[25] = 31'h0a47cad5;
    stim[26] = 31'h071ab4a2;
    stim[27] = 31'h35ec8a68;
    stim[28] = 31'h253aba26;
    stim[29] = 31'h03d78900;
    stim[30] = 31'h1c129f47;
    stim[31] = 31'h2af07a20;
    stim[32] = 31'h230a8d4f;
    stim[33] = 31'h2271e4d8;
    stim[34] = 31'h3c65894c;
    stim[35] = 31'h0c5dc05f;
    stim[36] = 31'h03fce523;
    stim[37] = 31'h157e68a8;
    stim[38] = 31'h35c40459;
    stim[39] = 31'h29ccdea9;
    stim[40] = 31'h0a0df6a0;
    stim[41] = 31'h177e2dbf;
    stim[42] = 31'h0e1cd654;
    stim[43] = 31'h0ce3e65f;
    stim[44] = 31'h10b83813;
    stim[45] = 31'h36fb49cd;
    stim[46] = 31'h136a7087;
    stim[47] = 31'h3620d153;
    stim[48] = 31'h2e8409f9;
    stim[49] = 31'h0b2ebfd2;
    stim[50] = 31'h19ccd001;
    stim[51] = 31'h175e8a78;
    stim[52] = 31'h3b143ae5;
    stim[53] = 31'h0a175814;
    stim[54] = 31'h14e84334;
    stim[55] = 31'h05235007;
    stim[56] = 31'h2d07c4cf;
    stim[57] = 31'h08f95c74;
    stim[58] = 31'h15a088f6;
    stim[59] = 31'h0e42bc88;
    stim[60] = 31'h26e608c8;
    stim[61] = 31'h3169a54b;
    stim[62] = 31'h21bef698;
    stim[63] = 31'h2eeceb40;
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
      expv[0] = 44'hxxxxxxxxxxx;
      expv[1] = 44'h0000xxxxxxf;
      expv[2] = 44'h0000000000f;
      expv[3] = 44'h0000000000f;
      expv[4] = 44'h0000000001f;
      expv[5] = 44'h0000000001f;
      expv[6] = 44'h0000000000f;
      expv[7] = 44'h0000000001f;
      expv[8] = 44'h0000000001f;
      expv[9] = 44'h0000000001f;
      expv[10] = 44'h0000000000f;
      expv[11] = 44'h0000800000f;
      expv[12] = 44'h000001ec189;
      expv[13] = 44'h000001ec19f;
      expv[14] = 44'he20001ec19f;
      expv[15] = 44'he20001ec189;
      expv[16] = 44'he20001ec19f;
      expv[17] = 44'he20001ec18f;
      expv[18] = 44'he20001ec19f;
      expv[19] = 44'he20001ec19f;
      expv[20] = 44'h000001ec18f;
      expv[21] = 44'h0000000001f;
      expv[22] = 44'h0000000001f;
      expv[23] = 44'h00000000019;
      expv[24] = 44'h00cb8000009;
      expv[25] = 44'h00cb000000f;
      expv[26] = 44'h00cb000001f;
      expv[27] = 44'h00cb000000f;
      expv[28] = 44'h00cb000001f;
      expv[29] = 44'h00cb000001f;
      expv[30] = 44'h00cb000001f;
      expv[31] = 44'h00cb0000009;
      expv[32] = 44'h00cb000001f;
      expv[33] = 44'h00cb000001f;
      expv[34] = 44'h00d8000000f;
      expv[35] = 44'h00d8000001f;
      expv[36] = 44'h00d8000000f;
      expv[37] = 44'h00d8000000f;
      expv[38] = 44'h00d8000001f;
      expv[39] = 44'h00d8000000f;
      expv[40] = 44'h00d8000000f;
      expv[41] = 44'h00d8000000f;
      expv[42] = 44'h00d8000000f;
      expv[43] = 44'h00d8000000f;
      expv[44] = 44'h00d8000000f;
      expv[45] = 44'h00d8000001f;
      expv[46] = 44'h00d8000001f;
      expv[47] = 44'h00d8000000f;
      expv[48] = 44'h00d8000000f;
      expv[49] = 44'h00d8000001f;
      expv[50] = 44'h00d8800000f;
      expv[51] = 44'h00d8740000f;
      expv[52] = 44'h00d8740001f;
      expv[53] = 44'he500740001f;
      expv[54] = 44'he500740001f;
      expv[55] = 44'he5007400009;
      expv[56] = 44'h0007740000f;
      expv[57] = 44'h0007740000f;
      expv[58] = 44'h0007740000f;
      expv[59] = 44'h0007740001f;
      expv[60] = 44'h0007740000f;
      expv[61] = 44'h0007740001f;
      expv[62] = 44'h0007740000f;
      expv[63] = 44'h0007740000f;
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
