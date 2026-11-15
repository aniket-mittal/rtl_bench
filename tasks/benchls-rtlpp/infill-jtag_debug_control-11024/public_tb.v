// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11024 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[47:10]),
    .take_action_break_a(out_vec[9:9]),
    .take_action_break_b(out_vec[8:8]),
    .take_action_break_c(out_vec[7:7]),
    .take_action_ocimem_a(out_vec[6:6]),
    .take_action_ocimem_b(out_vec[5:5]),
    .take_action_tracectrl(out_vec[4:4]),
    .take_no_action_break_a(out_vec[3:3]),
    .take_no_action_break_b(out_vec[2:2]),
    .take_no_action_break_c(out_vec[1:1]),
    .take_no_action_ocimem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h1b1fbdecdd3;
    stim[1] = 42'h19b547a8750;
    stim[2] = 42'h0039280c2d2;
    stim[3] = 42'h24167145dc6;
    stim[4] = 42'h39ccef2b7bd;
    stim[5] = 42'h3887cf0989e;
    stim[6] = 42'h06b32e09acc;
    stim[7] = 42'h04892475f4f;
    stim[8] = 42'h04ece261ef0;
    stim[9] = 42'h205cc0933b7;
    stim[10] = 42'h3d3a7881005;
    stim[11] = 42'h0ca32f45143;
    stim[12] = 42'h2b49a905e3f;
    stim[13] = 42'h3ec9ae756bc;
    stim[14] = 42'h2d0466380e0;
    stim[15] = 42'h08ad4c15fee;
    stim[16] = 42'h2c01e33ef68;
    stim[17] = 42'h036271f579a;
    stim[18] = 42'h0a59e64d0ee;
    stim[19] = 42'h0734e51ed4a;
    stim[20] = 42'h33d7314590a;
    stim[21] = 42'h10ce38e2ddc;
    stim[22] = 42'h292dd94a0e0;
    stim[23] = 42'h1cdcc03d0de;
    stim[24] = 42'h3614f6dc06f;
    stim[25] = 42'h1cf3e93ee28;
    stim[26] = 42'h2011ae9fb44;
    stim[27] = 42'h3ccbd026536;
    stim[28] = 42'h0ea112f9992;
    stim[29] = 42'h00df04e090f;
    stim[30] = 42'h1466eee7c75;
    stim[31] = 42'h0d8f3b91d47;
    stim[32] = 42'h0bde99bd24d;
    stim[33] = 42'h052c5a078dd;
    stim[34] = 42'h3c068fe19fa;
    stim[35] = 42'h22208fa2fd9;
    stim[36] = 42'h0fc846d3012;
    stim[37] = 42'h08b90f8cf15;
    stim[38] = 42'h3dfd8b047d4;
    stim[39] = 42'h2939cbfed7c;
    stim[40] = 42'h3c8d2155e99;
    stim[41] = 42'h1cd3f40f1fe;
    stim[42] = 42'h16379c486e0;
    stim[43] = 42'h0c5c03f79e3;
    stim[44] = 42'h10f1a6e8a54;
    stim[45] = 42'h35e342c9585;
    stim[46] = 42'h0a2e645a31e;
    stim[47] = 42'h2685a6f76e5;
    stim[48] = 42'h329136e0274;
    stim[49] = 42'h3d87d21d42b;
    stim[50] = 42'h01ae200fa5d;
    stim[51] = 42'h17c38e00ecc;
    stim[52] = 42'h23c56b785d7;
    stim[53] = 42'h1e7bd7399b0;
    stim[54] = 42'h0eee7f984f9;
    stim[55] = 42'h2c8e0cb0e21;
    stim[56] = 42'h177481c9ff0;
    stim[57] = 42'h2a830ce0b4e;
    stim[58] = 42'h23c6becf4f6;
    stim[59] = 42'h00fc2e887c5;
    stim[60] = 42'h18f3480c489;
    stim[61] = 42'h21713639107;
    stim[62] = 42'h22a70aee3b2;
    stim[63] = 42'h1dd3b4db8ce;
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
      expv[0] = 48'hxxxxxxxxxxxx;
      expv[1] = 48'hxxxxxxxxxxxx;
      expv[2] = 48'hxxxxxxxxxxxx;
      expv[3] = 48'hxxxxxxxxxxxx;
      expv[4] = 48'hxxxxxxxxxxxx;
      expv[5] = 48'hxxxxxxxxxx00;
      expv[6] = 48'h887cf0989x0x;
      expv[7] = 48'h887cf0989c00;
      expv[8] = 48'h887cf0989c00;
      expv[9] = 48'h4ece261ef001;
      expv[10] = 48'h4ece261ef000;
      expv[11] = 48'hd3a788100400;
      expv[12] = 48'hd3a788100400;
      expv[13] = 48'hb49a905e3e00;
      expv[14] = 48'hb49a905e3c00;
      expv[15] = 48'hd0466380e100;
      expv[16] = 48'hd0466380e000;
      expv[17] = 48'hd0466380e000;
      expv[18] = 48'hd0466380e000;
      expv[19] = 48'ha59e64d0ee00;
      expv[20] = 48'ha59e64d0ec00;
      expv[21] = 48'h3d7314590808;
      expv[22] = 48'h3d7314590800;
      expv[23] = 48'h3d7314590800;
      expv[24] = 48'h3d7314590800;
      expv[25] = 48'h3d7314590800;
      expv[26] = 48'h3d7314590800;
      expv[27] = 48'h011ae9fb4408;
      expv[28] = 48'h011ae9fb4400;
      expv[29] = 48'h011ae9fb4400;
      expv[30] = 48'h011ae9fb4400;
      expv[31] = 48'h466eee7c7410;
      expv[32] = 48'h466eee7c7400;
      expv[33] = 48'h466eee7c7400;
      expv[34] = 48'h466eee7c7400;
      expv[35] = 48'hc068fe19f801;
      expv[36] = 48'hc068fe19f800;
      expv[37] = 48'hc068fe19f800;
      expv[38] = 48'h8b90f8cf1401;
      expv[39] = 48'h8b90f8cf1400;
      expv[40] = 48'h939cbfed7c10;
      expv[41] = 48'h939cbfed7c00;
      expv[42] = 48'h939cbfed7c00;
      expv[43] = 48'h939cbfed7c00;
      expv[44] = 48'h939cbfed7c00;
      expv[45] = 48'h0f1a6e8a5401;
      expv[46] = 48'h0f1a6e8a5400;
      expv[47] = 48'ha2e645a31c20;
      expv[48] = 48'ha2e645a31c00;
      expv[49] = 48'ha2e645a31c00;
      expv[50] = 48'hd87d21d42800;
      expv[51] = 48'hd87d21d42800;
      expv[52] = 48'hd87d21d42800;
      expv[53] = 48'h3c56b785d408;
      expv[54] = 48'h3c56b785d400;
      expv[55] = 48'h3c56b785d400;
      expv[56] = 48'hc8e0cb0e2100;
      expv[57] = 48'hc8e0cb0e2000;
      expv[58] = 48'hc8e0cb0e2000;
      expv[59] = 48'hc8e0cb0e2000;
      expv[60] = 48'hc8e0cb0e2000;
      expv[61] = 48'h8f3480c48a00;
      expv[62] = 48'h8f3480c48800;
      expv[63] = 48'h8f3480c48800;
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
