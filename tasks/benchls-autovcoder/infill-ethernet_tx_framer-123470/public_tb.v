// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_123470 dut (
    .clk_mac(clk),
    .rst_n(in_vec[11:11]),
    .tx_ack(in_vec[10:10]),
    .tx_axis_mac_tdata(in_vec[9:2]),
    .tx_axis_mac_tvalid(in_vec[1:1]),
    .tx_axis_mac_tlast(in_vec[0:0]),
    .tx_vld(out_vec[11:11]),
    .tx_dat(out_vec[10:3]),
    .tx_sof(out_vec[2:2]),
    .tx_eof(out_vec[1:1]),
    .tx_axis_mac_tready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h4d9;
    stim[1] = 12'h05f;
    stim[2] = 12'h89a;
    stim[3] = 12'hd71;
    stim[4] = 12'hda8;
    stim[5] = 12'heb1;
    stim[6] = 12'h8b8;
    stim[7] = 12'h81c;
    stim[8] = 12'he74;
    stim[9] = 12'h83b;
    stim[10] = 12'h98c;
    stim[11] = 12'ha12;
    stim[12] = 12'hf9a;
    stim[13] = 12'hb02;
    stim[14] = 12'ha0d;
    stim[15] = 12'h99b;
    stim[16] = 12'hc3f;
    stim[17] = 12'h869;
    stim[18] = 12'h9c0;
    stim[19] = 12'hd89;
    stim[20] = 12'ha1e;
    stim[21] = 12'hab6;
    stim[22] = 12'ha66;
    stim[23] = 12'h8e4;
    stim[24] = 12'hf2c;
    stim[25] = 12'he50;
    stim[26] = 12'h9f2;
    stim[27] = 12'hf16;
    stim[28] = 12'hdef;
    stim[29] = 12'hb9e;
    stim[30] = 12'hce4;
    stim[31] = 12'h886;
    stim[32] = 12'hc85;
    stim[33] = 12'haa5;
    stim[34] = 12'h861;
    stim[35] = 12'h877;
    stim[36] = 12'hf9c;
    stim[37] = 12'hffe;
    stim[38] = 12'hcba;
    stim[39] = 12'h9d4;
    stim[40] = 12'ha31;
    stim[41] = 12'ha76;
    stim[42] = 12'h72d;
    stim[43] = 12'hcc4;
    stim[44] = 12'he26;
    stim[45] = 12'hf6d;
    stim[46] = 12'hd3d;
    stim[47] = 12'hb16;
    stim[48] = 12'he8d;
    stim[49] = 12'heaa;
    stim[50] = 12'he08;
    stim[51] = 12'hd0c;
    stim[52] = 12'h969;
    stim[53] = 12'hcd6;
    stim[54] = 12'h8e5;
    stim[55] = 12'hf6e;
    stim[56] = 12'ha0b;
    stim[57] = 12'hc8e;
    stim[58] = 12'hdbc;
    stim[59] = 12'hf5c;
    stim[60] = 12'hdb6;
    stim[61] = 12'h856;
    stim[62] = 12'hde1;
    stim[63] = 12'hdd7;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'hxxx;
      expv[2] = 12'hxxx;
      expv[3] = 12'h8bc;
      expv[4] = 12'h8ba;
      expv[5] = 12'h0b9;
      expv[6] = 12'h935;
      expv[7] = 12'h935;
      expv[8] = 12'h935;
      expv[9] = 12'h935;
      expv[10] = 12'h131;
      expv[11] = 12'h875;
      expv[12] = 12'h874;
      expv[13] = 12'h872;
      expv[14] = 12'h872;
      expv[15] = 12'h872;
      expv[16] = 12'h872;
      expv[17] = 12'h071;
      expv[18] = 12'hc25;
      expv[19] = 12'hc25;
      expv[20] = 12'hc25;
      expv[21] = 12'h421;
      expv[22] = 12'hc3c;
      expv[23] = 12'hc3c;
      expv[24] = 12'hc3d;
      expv[25] = 12'hd69;
      expv[26] = 12'hd69;
      expv[27] = 12'h569;
      expv[28] = 12'hbe5;
      expv[29] = 12'he28;
      expv[30] = 12'he29;
      expv[31] = 12'hbd9;
      expv[32] = 12'hbd8;
      expv[33] = 12'hbda;
      expv[34] = 12'hbda;
      expv[35] = 12'hbda;
      expv[36] = 12'hbda;
      expv[37] = 12'h3d9;
      expv[38] = 12'h90d;
      expv[39] = 12'hff8;
      expv[40] = 12'hff8;
      expv[41] = 12'hff8;
      expv[42] = 12'hff9;
      expv[43] = 12'h171;
      expv[44] = 12'h171;
      expv[45] = 12'h171;
      expv[46] = 12'hc4d;
      expv[47] = 12'hc4d;
      expv[48] = 12'h449;
      expv[49] = 12'he2d;
      expv[50] = 12'he2d;
      expv[51] = 12'hd55;
      expv[52] = 12'hd55;
      expv[53] = 12'h551;
      expv[54] = 12'h551;
      expv[55] = 12'h9ad;
      expv[56] = 12'h9ad;
      expv[57] = 12'hedd;
      expv[58] = 12'hc10;
      expv[59] = 12'hc12;
      expv[60] = 12'h411;
      expv[61] = 12'h91c;
      expv[62] = 12'h91d;
      expv[63] = 12'hb69;
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
