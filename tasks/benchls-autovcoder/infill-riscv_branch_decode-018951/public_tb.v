// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 72;
  localparam OW = 52;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_018951 dut (
    .io_inst(in_vec[71:40]),
    .io_pc(in_vec[39:0]),
    .io_out_is_ret(out_vec[51:51]),
    .io_out_is_call(out_vec[50:50]),
    .io_out_target(out_vec[49:10]),
    .io_out_cfi_type(out_vec[9:7]),
    .io_out_sfb_offset_valid(out_vec[6:6]),
    .io_out_sfb_offset_bits(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 72'h3b7f7032e9cc2127d1;
    stim[1] = 72'hcd80858ef95d7bb89b;
    stim[2] = 72'h1af1305e74a119d3ce;
    stim[3] = 72'h6c08bf95e56ecd09f5;
    stim[4] = 72'h91b02750353f11e346;
    stim[5] = 72'h328ac48f56520c9c2e;
    stim[6] = 72'h68240fcd909b984c7c;
    stim[7] = 72'hd4dc83997a846a00bf;
    stim[8] = 72'hb09afc1122a70f676e;
    stim[9] = 72'h3d2bf565c14ae7a615;
    stim[10] = 72'hc34c9104b748b8b412;
    stim[11] = 72'h9c58857eab409fc68b;
    stim[12] = 72'h5d48f6cdc815ab0e56;
    stim[13] = 72'hf767929a81ba469d10;
    stim[14] = 72'hc4c94e85b8027211d0;
    stim[15] = 72'hef9782d63cb53450fd;
    stim[16] = 72'ha6d8c12552f38b387e;
    stim[17] = 72'h5a5c83095ae7566147;
    stim[18] = 72'hf015853a6c1fcf1a6a;
    stim[19] = 72'hb3d48ce61ef13e4c67;
    stim[20] = 72'hbf556dab73eaa66ecf;
    stim[21] = 72'hc7f9a067b9e37b847b;
    stim[22] = 72'h5b9adaf4409bd08812;
    stim[23] = 72'hed876f4d3cf979e057;
    stim[24] = 72'h387b18d43627a5c614;
    stim[25] = 72'h9414d65d358d07502c;
    stim[26] = 72'h83ea9fb42aa2394001;
    stim[27] = 72'hcfcddcb31b835f1daf;
    stim[28] = 72'hbd4061ee66aa9df572;
    stim[29] = 72'h080c63cdb8ec962fc0;
    stim[30] = 72'h92ef2ccaf77562ce17;
    stim[31] = 72'h9db6eebf31f50f748b;
    stim[32] = 72'h92f2af66397d782bc4;
    stim[33] = 72'h32c45dc8ea7c4d5728;
    stim[34] = 72'h90633ada86e64b0c0a;
    stim[35] = 72'ha93a13afeba48b6987;
    stim[36] = 72'h8ea51aec24b5b948de;
    stim[37] = 72'h9d6d2eb4a596aece4c;
    stim[38] = 72'h3dfb091a1349c4edb7;
    stim[39] = 72'he80e9532e9b99e0fe5;
    stim[40] = 72'h5c4858022f75ff7768;
    stim[41] = 72'h8e5ce72eb8d997cc20;
    stim[42] = 72'h2e3a9fb1b1ab3ff8e5;
    stim[43] = 72'ha603d34bcfd996509a;
    stim[44] = 72'h0e50a209dc1f56b610;
    stim[45] = 72'h451b5cdf8a314c0467;
    stim[46] = 72'h03bc577d6fc87ef6b0;
    stim[47] = 72'h651941150d362f5b01;
    stim[48] = 72'h8f09b313a5981bd814;
    stim[49] = 72'hf1b65d37b8dc9cbc48;
    stim[50] = 72'h6bf3d34d346febb2f2;
    stim[51] = 72'h7c71e1e9a3c026cd4e;
    stim[52] = 72'h81075f4b61a6c4cc59;
    stim[53] = 72'hc8c3a17604c7b03396;
    stim[54] = 72'hd462323bb66334e66c;
    stim[55] = 72'h9cf3b751be8f76f51b;
    stim[56] = 72'h046b8d7edf450a8d3b;
    stim[57] = 72'h0f28e2986905a0d27f;
    stim[58] = 72'h83573e6f9e93cce0f2;
    stim[59] = 72'h29d3c3f75758f33f1c;
    stim[60] = 72'h542536675bab3c9a55;
    stim[61] = 72'h2f6cb0c8d6ba1ec110;
    stim[62] = 72'h4a81fa86dd5077f323;
    stim[63] = 72'hb77ac7344531df6fa0;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 52'h3a730c28e1820;
      expv[1] = 52'h3e575b0f5c80a;
      expv[2] = 52'h1d2846c35f020;
      expv[3] = 52'h395bb5702d01e;
      expv[4] = 52'h0d4fc0831800e;
      expv[5] = 52'h159485d7d5828;
      expv[6] = 52'h2426e714bf81e;
      expv[7] = 52'h1ea119a382806;
      expv[8] = 52'h08a9c2989d818;
      expv[9] = 52'h3052bce67980a;
      expv[10] = 52'h2dd22d5211822;
      expv[11] = 52'h2ad026141380a;
      expv[12] = 52'h32056d010a80c;
      expv[13] = 52'h206e8f8d21824;
      expv[14] = 52'h2e009ad58701c;
      expv[15] = 52'h0f2d4af7fd024;
      expv[16] = 52'h14bce100ba822;
      expv[17] = 52'h16b9d8bbba826;
      expv[18] = 52'h1b07f12a5a80a;
      expv[19] = 52'h07bc4cb5e8838;
      expv[20] = 52'h1cfaa6f6b083a;
      expv[21] = 52'h2e78dd4c3e020;
      expv[22] = 52'h1026f6d972834;
      expv[23] = 52'h0f3e5c51cb81e;
      expv[24] = 52'h0d89ec3866810;
      expv[25] = 52'h0d633f0a5b00c;
      expv[26] = 52'h0aa88cf40f83e;
      expv[27] = 52'h06e0d73caa838;
      expv[28] = 52'h19aaa39651802;
      expv[29] = 52'h2e3b28a410006;
      expv[30] = 52'h3ddd587bd1038;
      expv[31] = 52'h0c7d41979901c;
      expv[32] = 52'h0e5f5ab53c83e;
      expv[33] = 52'h3a9f146a9503a;
      expv[34] = 52'h21b98f8f44014;
      expv[35] = 52'h3ae9216106006;
      expv[36] = 52'h092d6b9672034;
      expv[37] = 52'h2965aafc0881c;
      expv[38] = 52'h04d273fe65012;
      expv[39] = 52'h3a6e67299900a;
      expv[40] = 52'h0bdd81f34b010;
      expv[41] = 52'h2e36652d4102e;
      expv[42] = 52'h2c6ad2a4f183e;
      expv[43] = 52'h33f66288be826;
      expv[44] = 52'h3707d5d7bd024;
      expv[45] = 52'h228c55d82d818;
      expv[46] = 52'h1bf222d3ba82e;
      expv[47] = 52'h034d8e2a54002;
      expv[48] = 52'h2966056241026;
      expv[49] = 52'h2e3724c6d881a;
      expv[50] = 52'h0d1bfbe46c026;
      expv[51] = 52'h28f00a2f45002;
      expv[52] = 52'h1869af071a01e;
      expv[53] = 52'h0131e8f608802;
      expv[54] = 52'h2d98c9c6ec804;
      expv[55] = 52'h2fa3daabba00e;
      expv[56] = 52'h37d145836001a;
      expv[57] = 52'h1a416a6cdc024;
      expv[58] = 52'h27a4f1064993c;
      expv[59] = 52'h15d63dc26e006;
      expv[60] = 52'h16ead073e580c;
      expv[61] = 52'h35ae8add01820;
      expv[62] = 52'h37541e79f2834;
      expv[63] = 52'h114c768ec582e;
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
