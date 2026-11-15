// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 48;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  spid_readbuffer dut (
    .clk_i(clk),
    .rst_ni(in_vec[47:47]),
    .sys_rst_ni(in_vec[46:46]),
    .current_address_i(in_vec[45:14]),
    .threshold_i(in_vec[13:4]),
    .sfdp_hit_i(in_vec[3:3]),
    .mailbox_hit_i(in_vec[2:2]),
    .mailbox_en_i(in_vec[1:1]),
    .start_i(in_vec[0:0]),
    .event_watermark_o(out_vec[1:1]),
    .event_flip_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 48'h4d83aaa36f18;
    stim[1] = 48'h11848c6daa9c;
    stim[2] = 48'hc6beca379c6c;
    stim[3] = 48'hbff53b949d86;
    stim[4] = 48'h93a914ee2795;
    stim[5] = 48'hb2f777ff10a6;
    stim[6] = 48'h9b2c86126039;
    stim[7] = 48'hd44b24e54e04;
    stim[8] = 48'hc40c55d99d4a;
    stim[9] = 48'he842c18748bb;
    stim[10] = 48'h8450e9a20563;
    stim[11] = 48'hcacc04bedfb0;
    stim[12] = 48'he99f63c99774;
    stim[13] = 48'hfc9968c88320;
    stim[14] = 48'he344f127e60e;
    stim[15] = 48'hbfbf8be0fc33;
    stim[16] = 48'hb76b7e3647f9;
    stim[17] = 48'ha31ddbec3d01;
    stim[18] = 48'hb58a930aa779;
    stim[19] = 48'hb35ac09611d8;
    stim[20] = 48'he68b25019926;
    stim[21] = 48'he674d9b65f74;
    stim[22] = 48'h89df49cfd88a;
    stim[23] = 48'hf1161678ec36;
    stim[24] = 48'h8a5b767ffedf;
    stim[25] = 48'hbeee582cfe8f;
    stim[26] = 48'h80117c6f369c;
    stim[27] = 48'h87abc1c130fc;
    stim[28] = 48'hac3516913a0b;
    stim[29] = 48'he36e1f3d6d41;
    stim[30] = 48'he0cdbc6f5ede;
    stim[31] = 48'h8edc203a1559;
    stim[32] = 48'h8d251dd88c5f;
    stim[33] = 48'hc0f7bd26eb75;
    stim[34] = 48'h93b53249a8aa;
    stim[35] = 48'hd3d821524361;
    stim[36] = 48'heef9c1ffe161;
    stim[37] = 48'hb05fdfdcfaa6;
    stim[38] = 48'hd0759b044db5;
    stim[39] = 48'hedcdab752422;
    stim[40] = 48'he2ea8574357a;
    stim[41] = 48'hd96d60c04f47;
    stim[42] = 48'hea1c16df67fe;
    stim[43] = 48'hcd146e69f10e;
    stim[44] = 48'h88bb459ce0e7;
    stim[45] = 48'he925e43e38e5;
    stim[46] = 48'h1a1a50acd15a;
    stim[47] = 48'he627c15217db;
    stim[48] = 48'hadfe65c4818e;
    stim[49] = 48'hba7e319dd6e0;
    stim[50] = 48'h8f3e4371542d;
    stim[51] = 48'hc9f29e04c9f8;
    stim[52] = 48'hb3fef63bd681;
    stim[53] = 48'hc5f4a2cb78dc;
    stim[54] = 48'hd0854970262c;
    stim[55] = 48'hb647ca731c31;
    stim[56] = 48'hff60d1dfcd2b;
    stim[57] = 48'hbfc93500484b;
    stim[58] = 48'h4a8e674012af;
    stim[59] = 48'hc950910b373a;
    stim[60] = 48'haf7b8ed29a70;
    stim[61] = 48'ha0b865de0c71;
    stim[62] = 48'he9cc8024e077;
    stim[63] = 48'hf7573a6ba642;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h0;
      expv[4] = 2'h0;
      expv[5] = 2'h2;
      expv[6] = 2'h0;
      expv[7] = 2'h2;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h2;
      expv[11] = 2'h2;
      expv[12] = 2'h0;
      expv[13] = 2'h0;
      expv[14] = 2'h0;
      expv[15] = 2'h0;
      expv[16] = 2'h2;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'h2;
      expv[20] = 2'h0;
      expv[21] = 2'h2;
      expv[22] = 2'h2;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h0;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h0;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h2;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'h2;
      expv[36] = 2'h0;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h2;
      expv[42] = 2'h0;
      expv[43] = 2'h0;
      expv[44] = 2'h2;
      expv[45] = 2'h0;
      expv[46] = 2'h0;
      expv[47] = 2'h0;
      expv[48] = 2'h0;
      expv[49] = 2'h0;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h0;
      expv[55] = 2'h2;
      expv[56] = 2'h2;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
