// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 72;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_172209 dut (
    .clock(clk),
    .reset(in_vec[71:71]),
    .start_tr(in_vec[70:70]),
    .device(in_vec[69:69]),
    .num_bits(in_vec[68:64]),
    .sclk_divider(in_vec[63:32]),
    .set_data(in_vec[31:0]),
    .ready(out_vec[4:4]),
    .sen(out_vec[3:2]),
    .sclk(out_vec[1:1]),
    .mosi(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 72'hf22cbc982f570098b8;
    stim[1] = 72'h8707b3b1a6eaba798a;
    stim[2] = 72'h26e7becca47dc675dc;
    stim[3] = 72'h39e6000fd1a554ab15;
    stim[4] = 72'h17c41201034d1df6fc;
    stim[5] = 72'h064cd52d13f2934414;
    stim[6] = 72'h4a22acbbe6bb7af8a1;
    stim[7] = 72'h6f7defe2ad377ce5a7;
    stim[8] = 72'h0612d41bfa42b80765;
    stim[9] = 72'h38ae6ce542e0cb1c52;
    stim[10] = 72'h002b3b974a03f43537;
    stim[11] = 72'h1d73bf4b99723c890c;
    stim[12] = 72'h19144ef7e3baabc104;
    stim[13] = 72'h34abc8ccf0078cdb93;
    stim[14] = 72'h7076c0a99f39cc0fae;
    stim[15] = 72'h1c7c44055daf9e79b9;
    stim[16] = 72'h4534526e2303fa5fab;
    stim[17] = 72'h308e9ca4c5a83abe64;
    stim[18] = 72'h386a68b0308c8ac620;
    stim[19] = 72'h153d805f8e8694b2dc;
    stim[20] = 72'h01cd35143426c2377c;
    stim[21] = 72'h69011338bf59c85061;
    stim[22] = 72'h213c5b94fc46d54afb;
    stim[23] = 72'h1e38e432460360a84c;
    stim[24] = 72'h78eb56629729e99185;
    stim[25] = 72'h7c5cac5f7028d6eeff;
    stim[26] = 72'h0a1d92ea0c04bcbda9;
    stim[27] = 72'h7e8770320f8ca50f94;
    stim[28] = 72'h6ec20bec9081860a66;
    stim[29] = 72'h12de0cbc0d51785713;
    stim[30] = 72'h3aad87d12a7c64acb1;
    stim[31] = 72'h2ac002f6cc6bd97982;
    stim[32] = 72'h1d83f9002ee2471dff;
    stim[33] = 72'h1aa70eae419f6f4d88;
    stim[34] = 72'h3bbb921e60866f74a2;
    stim[35] = 72'h538a738f005ad3e770;
    stim[36] = 72'h512df2f4ec485ad045;
    stim[37] = 72'h32c086c064641a9ab3;
    stim[38] = 72'h4f4dfa2a9ab722fc22;
    stim[39] = 72'h09dcacd11bff12b059;
    stim[40] = 72'h3632aedf3ae1bc1f7f;
    stim[41] = 72'h08a4ad4d8a6c21a8e3;
    stim[42] = 72'h402edc079009242016;
    stim[43] = 72'h5424e8ed2df5fe5048;
    stim[44] = 72'h50690f41cb11ea06c0;
    stim[45] = 72'h60fe975fae5dad0fff;
    stim[46] = 72'h294e65b92bff7acf09;
    stim[47] = 72'h2da858ee0c02fcf5ae;
    stim[48] = 72'h4c6437bcc3fdc2c79e;
    stim[49] = 72'h612432b8c4f3fe9e38;
    stim[50] = 72'h111d422e7013a30bdf;
    stim[51] = 72'h449586969bf8a996f6;
    stim[52] = 72'h3977fa61fb5cd9c52c;
    stim[53] = 72'h6ee397293abca36441;
    stim[54] = 72'h4bf8c53c862a89eff0;
    stim[55] = 72'h760da1124c96be330d;
    stim[56] = 72'h4e0285e21d35a8496d;
    stim[57] = 72'h4097f2bcc588e3f172;
    stim[58] = 72'h69ef2cc645ad408176;
    stim[59] = 72'h7a22709c20b3618897;
    stim[60] = 72'h70c4ad9834297cf180;
    stim[61] = 72'h7331cc063993be99a0;
    stim[62] = 72'h18c94e751c9dbb7b05;
    stim[63] = 72'h3ac42b4c95333a725a;
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
      expv[0] = 5'h1c;
      expv[1] = 5'h1c;
      expv[2] = 5'h1c;
      expv[3] = 5'h14;
      expv[4] = 5'h14;
      expv[5] = 5'h18;
      expv[6] = 5'h18;
      expv[7] = 5'h18;
      expv[8] = 5'h10;
      expv[9] = 5'h10;
      expv[10] = 5'h10;
      expv[11] = 5'h10;
      expv[12] = 5'h10;
      expv[13] = 5'h10;
      expv[14] = 5'h10;
      expv[15] = 5'h10;
      expv[16] = 5'h10;
      expv[17] = 5'h10;
      expv[18] = 5'h10;
      expv[19] = 5'h10;
      expv[20] = 5'h10;
      expv[21] = 5'h10;
      expv[22] = 5'h10;
      expv[23] = 5'h10;
      expv[24] = 5'h10;
      expv[25] = 5'h10;
      expv[26] = 5'h10;
      expv[27] = 5'h10;
      expv[28] = 5'h10;
      expv[29] = 5'h10;
      expv[30] = 5'h10;
      expv[31] = 5'h10;
      expv[32] = 5'h10;
      expv[33] = 5'h10;
      expv[34] = 5'h10;
      expv[35] = 5'h10;
      expv[36] = 5'h10;
      expv[37] = 5'h10;
      expv[38] = 5'h10;
      expv[39] = 5'h10;
      expv[40] = 5'h10;
      expv[41] = 5'h10;
      expv[42] = 5'h10;
      expv[43] = 5'h10;
      expv[44] = 5'h10;
      expv[45] = 5'h10;
      expv[46] = 5'h10;
      expv[47] = 5'h10;
      expv[48] = 5'h10;
      expv[49] = 5'h10;
      expv[50] = 5'h10;
      expv[51] = 5'h10;
      expv[52] = 5'h10;
      expv[53] = 5'h10;
      expv[54] = 5'h10;
      expv[55] = 5'h10;
      expv[56] = 5'h10;
      expv[57] = 5'h10;
      expv[58] = 5'h10;
      expv[59] = 5'h10;
      expv[60] = 5'h10;
      expv[61] = 5'h10;
      expv[62] = 5'h10;
      expv[63] = 5'h10;
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
