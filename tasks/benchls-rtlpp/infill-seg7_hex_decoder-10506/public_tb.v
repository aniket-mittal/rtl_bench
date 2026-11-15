// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 52;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10506 dut (
    .clk(clk),
    .flash(in_vec[51:51]),
    .Hexs(in_vec[50:19]),
    .LES(in_vec[18:11]),
    .point(in_vec[10:3]),
    .rst(in_vec[2:2]),
    .Start(in_vec[1:1]),
    .SW0(in_vec[0:0]),
    .seg_clk(out_vec[3:3]),
    .seg_clrn(out_vec[2:2]),
    .SEG_PEN(out_vec[1:1]),
    .seg_sout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 52'he977e8ec3efec;
    stim[1] = 52'hfacb449d96f06;
    stim[2] = 52'h23ae5f0519a02;
    stim[3] = 52'hcb4fdf8720c0a;
    stim[4] = 52'hde49b24701a3a;
    stim[5] = 52'he9f442503e77d;
    stim[6] = 52'h81274a784c77b;
    stim[7] = 52'h4c32b76be6713;
    stim[8] = 52'h156602a502b61;
    stim[9] = 52'h5547b5d93c471;
    stim[10] = 52'h255ee81d407a3;
    stim[11] = 52'h15c01622c1f72;
    stim[12] = 52'h99ae4fe129b83;
    stim[13] = 52'h7b59a4bf74cf0;
    stim[14] = 52'hb47400a8bc001;
    stim[15] = 52'h5e92a140f6298;
    stim[16] = 52'h26f3a0f8e9888;
    stim[17] = 52'hc0956e0aed8a8;
    stim[18] = 52'hf822e9713ce62;
    stim[19] = 52'h1427b33efda4a;
    stim[20] = 52'h9fb7eb1792e4b;
    stim[21] = 52'h7ac7311c9bc18;
    stim[22] = 52'h8b16cfa02041b;
    stim[23] = 52'h972a23ae56739;
    stim[24] = 52'h96db4779d2cd9;
    stim[25] = 52'h07bee9b9f44a9;
    stim[26] = 52'h39e2aa5aa345a;
    stim[27] = 52'h672d4504dcce2;
    stim[28] = 52'he82961cb2ba52;
    stim[29] = 52'hf1e9f4e73f248;
    stim[30] = 52'he8dc849953228;
    stim[31] = 52'h7cecf018ff0f0;
    stim[32] = 52'h3185618324c42;
    stim[33] = 52'h740449e14f4fa;
    stim[34] = 52'h5cc2081066707;
    stim[35] = 52'hc123318f81e93;
    stim[36] = 52'ha6dee3f7fe6b0;
    stim[37] = 52'hc51ed204cdcc2;
    stim[38] = 52'h034a557ab83c0;
    stim[39] = 52'ha822907a1e4c0;
    stim[40] = 52'hb19f3deb56a29;
    stim[41] = 52'h1bbf40fee8d12;
    stim[42] = 52'h79b91838060d0;
    stim[43] = 52'h05aeb791c41d0;
    stim[44] = 52'hc6e37014d1350;
    stim[45] = 52'h163b7d9c35ea1;
    stim[46] = 52'h04faf5a5c5928;
    stim[47] = 52'h308df65781a30;
    stim[48] = 52'h47d06eeda2170;
    stim[49] = 52'h2f3d6738e1772;
    stim[50] = 52'h411cb1e11b2d9;
    stim[51] = 52'h191c85d2c6c80;
    stim[52] = 52'h783e3102e5573;
    stim[53] = 52'h07b1c67e2a12b;
    stim[54] = 52'h6f2614ef93871;
    stim[55] = 52'h745220ed43029;
    stim[56] = 52'h8dead12acd558;
    stim[57] = 52'h76da5e1731f82;
    stim[58] = 52'h2e5a7fee551d8;
    stim[59] = 52'h15aac0da39a08;
    stim[60] = 52'h3643a16cd74db;
    stim[61] = 52'h50f62e82aa8c0;
    stim[62] = 52'h206adb715aafa;
    stim[63] = 52'h4e052eeeb525b;
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
      expv[0] = 4'h0;
      expv[1] = 4'h0;
      expv[2] = 4'h4;
      expv[3] = 4'h6;
      expv[4] = 4'h7;
      expv[5] = 4'h0;
      expv[6] = 4'h4;
      expv[7] = 4'h7;
      expv[8] = 4'h6;
      expv[9] = 4'h6;
      expv[10] = 4'h6;
      expv[11] = 4'h6;
      expv[12] = 4'h6;
      expv[13] = 4'h7;
      expv[14] = 4'h7;
      expv[15] = 4'h7;
      expv[16] = 4'h7;
      expv[17] = 4'h7;
      expv[18] = 4'h7;
      expv[19] = 4'h7;
      expv[20] = 4'h6;
      expv[21] = 4'h7;
      expv[22] = 4'h7;
      expv[23] = 4'h7;
      expv[24] = 4'h7;
      expv[25] = 4'h7;
      expv[26] = 4'h7;
      expv[27] = 4'h6;
      expv[28] = 4'h7;
      expv[29] = 4'h7;
      expv[30] = 4'h7;
      expv[31] = 4'h6;
      expv[32] = 4'h7;
      expv[33] = 4'h6;
      expv[34] = 4'h0;
      expv[35] = 4'h4;
      expv[36] = 4'h7;
      expv[37] = 4'h7;
      expv[38] = 4'h7;
      expv[39] = 4'h6;
      expv[40] = 4'h6;
      expv[41] = 4'h6;
      expv[42] = 4'h6;
      expv[43] = 4'h6;
      expv[44] = 4'h7;
      expv[45] = 4'h7;
      expv[46] = 4'h6;
      expv[47] = 4'h7;
      expv[48] = 4'h7;
      expv[49] = 4'h7;
      expv[50] = 4'h6;
      expv[51] = 4'h7;
      expv[52] = 4'h6;
      expv[53] = 4'h6;
      expv[54] = 4'h7;
      expv[55] = 4'h7;
      expv[56] = 4'h6;
      expv[57] = 4'h6;
      expv[58] = 4'h7;
      expv[59] = 4'h7;
      expv[60] = 4'h7;
      expv[61] = 4'h6;
      expv[62] = 4'h6;
      expv[63] = 4'h6;
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
