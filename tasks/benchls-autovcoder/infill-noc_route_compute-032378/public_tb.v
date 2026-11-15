// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 72;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_032378 dut (
    .my_loc_x_in(in_vec[71:64]),
    .my_loc_y_in(in_vec[63:56]),
    .my_chip_id_in(in_vec[55:42]),
    .abs_x(in_vec[41:34]),
    .abs_y(in_vec[33:26]),
    .abs_chip_id(in_vec[25:12]),
    .final_bits(in_vec[11:9]),
    .length(in_vec[8:1]),
    .header_in(in_vec[0:0]),
    .route_req_n(out_vec[9:9]),
    .route_req_e(out_vec[8:8]),
    .route_req_s(out_vec[7:7]),
    .route_req_w(out_vec[6:6]),
    .route_req_p(out_vec[5:5]),
    .default_ready_n(out_vec[4:4]),
    .default_ready_e(out_vec[3:3]),
    .default_ready_s(out_vec[2:2]),
    .default_ready_w(out_vec[1:1]),
    .default_ready_p(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 72'h87bde8d3f848343797;
    stim[1] = 72'h782b1cd78616d51336;
    stim[2] = 72'h9206aad4fdc382c378;
    stim[3] = 72'h86633709bc55325682;
    stim[4] = 72'h7872b25388ad5fe9cb;
    stim[5] = 72'h0dcdb0ffbe11e87de1;
    stim[6] = 72'hcae95c9b131a3c097d;
    stim[7] = 72'h33905b022a96691a34;
    stim[8] = 72'h871c032fd0777aded9;
    stim[9] = 72'hc81935ddea1b128441;
    stim[10] = 72'hc9ee88c789f8b17ebb;
    stim[11] = 72'he793a65a0b6ecbbd25;
    stim[12] = 72'haf53b1fda888928fe3;
    stim[13] = 72'h6223aebbb790593204;
    stim[14] = 72'hf90203c061036cb7fb;
    stim[15] = 72'h77ff65ec9e1651daa7;
    stim[16] = 72'h4d523325d5096347de;
    stim[17] = 72'hc89c52c7c7a5d2bfa4;
    stim[18] = 72'h9390234e9625cf4b10;
    stim[19] = 72'h72e5aaec0d6af0d014;
    stim[20] = 72'ha1e1dde4e73db40a9d;
    stim[21] = 72'hb6668ce1a41e78cca0;
    stim[22] = 72'hbeb76e33950dea6f3f;
    stim[23] = 72'ha6b08c54735ed999df;
    stim[24] = 72'h224fca7fc3e85874b5;
    stim[25] = 72'hcf2995ef10f6be3553;
    stim[26] = 72'hde0fc659d95d61767c;
    stim[27] = 72'hf0b8bdc71e951594ce;
    stim[28] = 72'hcef2c0cffc5a63f9ff;
    stim[29] = 72'h1b50ad49737ebe6671;
    stim[30] = 72'he9fd4dcb731dc6b6a0;
    stim[31] = 72'hfa8b9e03220dd4c47c;
    stim[32] = 72'h06bfb9f2ba6464ab7b;
    stim[33] = 72'hc955b864d06d462e0c;
    stim[34] = 72'h5a02c42f80d055e9c5;
    stim[35] = 72'h0665cdf41e648dc84a;
    stim[36] = 72'h091c387e1e4937b49a;
    stim[37] = 72'h907aed477cca9f8d77;
    stim[38] = 72'h8c172176602dca7b66;
    stim[39] = 72'hac415f423f074da09c;
    stim[40] = 72'he6da279bc7d7b5b546;
    stim[41] = 72'h82c475156ec5b9b150;
    stim[42] = 72'hb610c7d3ac5317e9f6;
    stim[43] = 72'h4976cc99ac6efdeef5;
    stim[44] = 72'h2e5830c7c3adbad181;
    stim[45] = 72'h0a120e8b87b34feaf6;
    stim[46] = 72'ha30b3d62002c41e54c;
    stim[47] = 72'h786ef8f6203cc66568;
    stim[48] = 72'hcf887658f333349330;
    stim[49] = 72'he0e14890b65171003e;
    stim[50] = 72'h5afd81f9ce2b594f74;
    stim[51] = 72'h4afb7eff75c249eda2;
    stim[52] = 72'h25098fe96f6a24fbd0;
    stim[53] = 72'hc83ab7ef2da28bd44d;
    stim[54] = 72'hef19200e9906e18799;
    stim[55] = 72'hc3e845eb39cdae3468;
    stim[56] = 72'h6f19d29188db3d3134;
    stim[57] = 72'h7cb97b8d149bc40e07;
    stim[58] = 72'hc5aa5a183459d3056b;
    stim[59] = 72'h2d4cebd697622dde20;
    stim[60] = 72'h45187c98f2dffe981f;
    stim[61] = 72'h937f40a42fcd84bb13;
    stim[62] = 72'h1bd9c97790eea6c865;
    stim[63] = 72'h763f9a32a14a574260;
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
      expv[0] = 10'h042;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h042;
      expv[5] = 10'h042;
      expv[6] = 10'h042;
      expv[7] = 10'h000;
      expv[8] = 10'h042;
      expv[9] = 10'h042;
      expv[10] = 10'h042;
      expv[11] = 10'h042;
      expv[12] = 10'h042;
      expv[13] = 10'h000;
      expv[14] = 10'h042;
      expv[15] = 10'h042;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h000;
      expv[19] = 10'h000;
      expv[20] = 10'h042;
      expv[21] = 10'h000;
      expv[22] = 10'h042;
      expv[23] = 10'h042;
      expv[24] = 10'h042;
      expv[25] = 10'h042;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h042;
      expv[29] = 10'h042;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h042;
      expv[33] = 10'h000;
      expv[34] = 10'h042;
      expv[35] = 10'h000;
      expv[36] = 10'h000;
      expv[37] = 10'h042;
      expv[38] = 10'h000;
      expv[39] = 10'h000;
      expv[40] = 10'h000;
      expv[41] = 10'h000;
      expv[42] = 10'h000;
      expv[43] = 10'h042;
      expv[44] = 10'h042;
      expv[45] = 10'h000;
      expv[46] = 10'h000;
      expv[47] = 10'h000;
      expv[48] = 10'h000;
      expv[49] = 10'h000;
      expv[50] = 10'h000;
      expv[51] = 10'h000;
      expv[52] = 10'h000;
      expv[53] = 10'h042;
      expv[54] = 10'h042;
      expv[55] = 10'h000;
      expv[56] = 10'h000;
      expv[57] = 10'h042;
      expv[58] = 10'h042;
      expv[59] = 10'h000;
      expv[60] = 10'h042;
      expv[61] = 10'h042;
      expv[62] = 10'h042;
      expv[63] = 10'h000;
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
